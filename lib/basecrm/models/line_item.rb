# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class LineItem < Model
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the line item.
    # attr_reader :id
    # @!attribute [r] name
    #   @return [String] Name of the product. Value is copied from the product.
    # attr_reader :name
    # @!attribute [r] sku
    #   @return [String] Stock Keeping Unit identification code. Value is copied from the product.
    # attr_reader :sku
    # @!attribute [r] description
    #   @return [String] Description of the product. Value is copied from the product.
    # attr_reader :description
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time that the line item was created in UTC (ISO8601 format).
    # attr_reader :created_at
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update on the line item in UTC (ISO8601 format).
    # attr_reader :updated_at

    # @!attribute [rw] product_id
    #   @return [Integer] Unique identifier of the product based on which line item is created. It is not available after creation.
    # attr_accessor :product_id
    # @!attribute [rw] value
    #   @return [Integer] Value of one unit of the product. It is product’s price after applying markup.
    # attr_accessor :value
    # @!attribute [rw] variation
    #   @return [Integer] Variation of the product’s price for this line item. Value of 5 means that 5% markup is added, -10 means there is a 10% discount.
    # attr_accessor :variation
    # @!attribute [rw] currency
    #   @return [String] Currency of value and price, specified in 3-character currency code (ISO4217) format.
    # attr_accessor :currency
    # @!attribute [rw] quantity
    #   @return [Integer] Quantity of the product included in this line item. Default value is 1.
    # attr_accessor :quantity
    # @!attribute [rw] price
    #   @return [Integer] Price of one unit of the product. Value is copied from the product.
    # attr_accessor :price
  end
end
