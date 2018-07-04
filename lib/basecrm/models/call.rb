# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class Call < Model
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the call.
    # attr_reader :id
    # @!attribute [r] upated_at
    #   @return [DateTime] Date and time of the last update in UTC (ISO8601 format).
    # attr_reader :upated_at

    # @!attribute [rw] associated_deal_ids
    #   @return [Array<Integer>] An array of ids of deals associated to the call.
    # attr_accessor :associated_deal_ids
    # @!attribute [rw] duration
    #   @return [Integer] Duration of the call in seconds.
    # attr_accessor :duration
    # @!attribute [rw] external_id
    #   @return [String] Unique identifier of a call from an external system.
    # attr_accessor :external_id
    # @!attribute [rw] incoming
    #   @return [Boolean] Phone number of the person with which the call was made.
    # attr_accessor :incoming
    # @!attribute [rw] made_at
    #   @return [DateTime] Date and time of when the call was made (started) in UTC (ISO8601 format).
    # attr_accessor :made_at
    # @!attribute [rw] missed
    #   @return [Boolean] Indicator of whether the call was missed (not answered) by the user or not.
    # attr_accessor :missed
    # @!attribute [rw] outcome_id
    #   @return [Integer] Unique identifier of Call Outcome assigned to the call.
    # attr_accessor :outcome_id
    # @!attribute [rw] phone_number
    #   @return [String] Indicator of whether the call was incoming or not.
    # attr_accessor :phone_number
    # @!attribute [rw] recording_url
    #   @return [String] URL pointing to call recording.
    # attr_accessor :recording_url
    # @!attribute [rw] resource_id
    #   @return [Integer] Unique identifier of the resource the call is attached to.
    # attr_accessor :resource_id
    # @!attribute [rw] resource_type
    #   @return [String] Name of the resource type the call is attached to.
    # attr_accessor :resource_type
    # @!attribute [rw] summary
    #   @return [String] Content of the note about this call.
    # attr_accessor :summary
    # @!attribute [rw] user_id
    #   @return [Integer] Unique identifier of the user who performed the call.
    # attr_accessor :user_id
  end
end
