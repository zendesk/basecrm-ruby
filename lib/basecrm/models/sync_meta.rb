module BaseCRM
  class SyncMeta < Model
    # @attribute [r] event_type
    #   @return [String] An event type. Possible values: `created`, `updated`, `deleted`.
    # attr_reader :event_type

    # @attribute [r] ack_key
    #   @return [String] An acknowledgement key.
    # attr_reader :ack_key

    # @attribute [r] revision
    #   @return [String] Data revision.
    # attr_reader :revision

    def acknowledged?
      !!@acknowledged
    end

    def ack
      @acknowledged = true
      [:ack, self.ack_key]
    end

    def nack
      @acknowledged = true
      [:nack, nil]
    end
  end
end
