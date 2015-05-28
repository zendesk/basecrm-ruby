module BaseCRM
  class SyncSession < Model
    # @attribute [r] id
    #   @return [String] Unique identifier for the sync session.
    # attr_reader :id

    # @attribute [r] queues
    #   @return [Array<SyncQueue>] A list of sync queues.
    # attr_reader :queues
  end
end
