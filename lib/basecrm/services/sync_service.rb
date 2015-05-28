module BaseCRM
  class SyncService

    def initialize(client)
      @client = client
    end

    # Start synchronization flow
    #
    # post '/sync/start'
    #
    # Starts a new synchronization session.
    # This is the first endpoint to call, in order to start a new synchronization session.
    #
    # @param device_uuid [String] Device's UUID for which to perform synchronization.
    # @return [SyncSession] The resulting object is the synchronization session object or nil if there is nothing to synchronize.
    def start(device_uuid)
      validate_device!(device_uuid)

      status, _, root = @client.post("/sync/start", nil, build_headers(device_uuid))
      return nil if status == 204

      build_session(root)
    end

    # Get data from queue
    #
    # get '/sync/{session_id}/queues/main'
    #
    # Fetch fresh data from the main queue.
    # Using session identifier you call continously the `#fetch` method to drain the main queue.
    #
    # @param device_uuid [String] Device's UUID for which to perform synchronization
    # @param session_id [String] Unique identifier of a synchronization session.
    # @param queue [String|Symbol] Queue name.
    # @return [Array<Array<SyncMeta, Model>>] The list of sync's metadata associated with data and data.
    def fetch(device_uuid, session_id, queue='main')
      validate_device!(device_uuid)
      raise ArgumentError, "session_id must not be nil nor empty" unless device_uuid && !device_uuid.strip.empty?
      raise ArgumentError, "queue name must not be nil nor empty" unless device_uuid && !device_uuid.strip.empty?

      status, _, root = @client.get("/sync/#{session_id}/queues/#{queue}", nil, build_headers(device_uuid))
      return [] if status == 204

      root[:items].map do |item|
        klass = classify_type(item[:meta][:type])
        [SyncMeta.new(item[:meta][:sync]), klass.new(item[:data])]
      end
    end

    # Acknowledge received data
    #
    # post '/sync/ack'
    #
    # Send acknowledgement keys to let know the Sync service which data you have.
    # As you fetch new data, you need to send acknowledgement keys.
    #
    # @param device_uuid [String] Device's UUID for which to perform synchronization.
    # @param ack_keys [Array<String>] The list of acknowledgement keys.
    # @return [Boolean] Status of the operation.
    def ack(device_uuid, ack_keys)
      validate_device!(device_uuid)
      raise ArgumentError, "ack_keys must not be nil and an array" unless ack_keys && ack_keys.is_a?(Array)
      return true if ack_keys.empty?

      payload = {
        :ack_keys => ack_keys.map(&:to_s)
      }
      status, _, _ = @client.post('/sync/ack', payload, build_headers(device_uuid))
      status == 204
    end

  private
    def validate_device!(device_uuid)
      raise ArgumentError, "device_uuid must not be nil nor empty" unless device_uuid && !device_uuid.strip.empty?
    end

    def build_headers(device_uuid)
      {
        "X-Basecrm-Device-UUID" => device_uuid
      }
    end

    def classify_type(type)
      "BaseCRM::#{type.split('_').map(&:capitalize).join}".constantize
    end

    def build_session(root)
      session_data = root[:data]
      session_data[:queues] = session_data[:queues].map { |queue| SyncQueue.new(queues[:data]) }
      SyncSession.new(session_data)
    end
  end
end
