# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class TextMessage < Model
    # @!attribute [r] associated_deal_ids
    #   @return [Array<Integer>] An array of ids of deals associated to the text message.
    # attr_reader :associated_deal_ids
    # @!attribute [r] content
    #   @return [String] Content of the text message.
    # attr_reader :content
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time of creation in UTC (ISO8601 format).
    # attr_reader :created_at
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the text_message.
    # attr_reader :id
    # @!attribute [r] incoming
    #   @return [Boolean] Indicator of whether the text message was incoming or not.
    # attr_reader :incoming
    # @!attribute [r] resource_id
    #   @return [Integer] Unique identifier of the resource the text message is attached to.
    # attr_reader :resource_id
    # @!attribute [r] resource_phone_number
    #   @return [String] Phone number of a resource the text message was sent to/received by.
    # attr_reader :resource_phone_number
    # @!attribute [r] resource_type
    #   @return [String] Name of a resource type the text message is attached to.
    # attr_reader :resource_type
    # @!attribute [r] sent_at
    #   @return [DateTime] Date and time of the message send time in UTC (ISO8601 format).
    # attr_reader :sent_at
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update in UTC (ISO8601 format).
    # attr_reader :updated_at
    # @!attribute [r] user_id
    #   @return [Integer] Unique identifier of a user who sent/received a text message.
    # attr_reader :user_id
    # @!attribute [r] user_phone_number
    #   @return [String] Phone number of a user who sent/received a text message.
    # attr_reader :user_phone_number

  end
end
