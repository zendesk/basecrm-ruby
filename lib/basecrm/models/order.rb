# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class Order < Model
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the order.
    # attr_reader :id
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time that the order was created in UTC (ISO8601 format).
    # attr_reader :created_at
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update on the order in UTC (ISO8601 format).
    # attr_reader :updated_at

    # @!attribute [rw] deal_id
    #   @return [Integer] ID of the deal the order is associated to.
    # attr_accessor :deal_id
    # @!attribute [rw] discount
    #   @return [Integer] Discount on the whole order in percents.
    # attr_accessor :discount
  end
end
