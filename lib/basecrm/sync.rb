module BaseCRM
  class Sync
    attr_reader :device_uuid
    attr_reader :client

    # Intantiate a new BaseCRM Sync API V2 high-level wrapper
    #
    # @param options[Hash] Wrapper options
    # @option options [String] :device_uuid Device's UUID.
    # @option options [BaseCRM::Client] :client BaseCRM API v2 client instance.
    #
    # @raise [ConfigurationError] if no device's uuid provided
    # @raise [ConfigurationError] if no client instance provided
    #
    # @return [Sync] New wrapper instance
    #
    # @see Client
    # @see SyncService
    def initialize(options)
      @device_uuid = options[:device_uuid]
      @client = options[:client]

      validate!
    end

    # Perform a full synchronization flow.
    # See the following example:
    #
    #   client = BaseCRM::Client.new(access_token: "<YOUR_ACCESS_TOKEN>")
    #   sync = BaseCRM::Sync.new(client: client, device_uuid: "<YOUR_DEVICES_UUID>")
    #   sync.fetch do |meta, resource|
    #     DB.send(meta.sync.event_type, entity) ? meta.sync.ack : meta.sync.nack
    #   end
    #
    # @param block [Proc] Procedure that will be called for every item in the queue. Takes two input arguments: SyncMeta instance
    #   associated with the resource, and the resource. You should use either `SyncQueue#ack` or `SyncQueue#nack` to return value from the block.
    #
    # @return nil
    def fetch(&block)
      return unless block_given?

      # Set up a new synchronization session for given device's UUID
      session = @client.sync.start(@device_uuid)

      # Check if there is anything to synchronize
      return unless  session && session.id

      # Drain the main queue unitl there is no more data (empty array)
      loop do
        queued_data = @client.sync.fetch(@device_uuid, session.id)

        # nothing more to synchronize ?
        break unless queued_data

        # something bad at the backend
        next if queued_data.empty?

        ack_keys = []
        queued_data.each do |sync_meta, resource|
          op, ack_key = block.call(sync_meta, resource)
          ack_keys << ack_key if op == :ack
        end

        # As we fetch new data, we need to send ackwledgement keys - if any
        @client.sync.ack(@device_uuid, ack_keys) unless ack_keys.empty?
      end
    end

  private
    def validate!
      unless @device_uuid
        raise ConfigurationError.new('No device UUID provided. '\
          'The UUID must not change between synchronization sessions. '\
          'Set your device\'s UUID during wrapper initialization using: '\
          '"Base::Sync.new(device_uuid: <YOUR_DEVICES_UUID>, client: client)".')
      end

      unless @client
        raise ConfigurationError.new('No "BaseCRM::Client" instance provided. '\
          'The high-level sync wrapper is using "BaseCRM::SyncService"\'s lowl-level interface '\
          'exposed within "BaseCRM::Client" scope.')
      end
    end
  end
end
