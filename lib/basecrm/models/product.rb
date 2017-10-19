# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class Product < Model
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the product.
    # attr_reader :id
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time that the product was created in UTC (ISO8601 format).
    # attr_reader :created_at
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update on the product in UTC (ISO8601 format).
    # attr_reader :updated_at

    # @!attribute [rw] name
    #   @return [String] Name of the product.
    # attr_accessor :name
    # @!attribute [rw] description
    #   @return [String] Description of the product.
    # attr_accessor :description
    # @!attribute [rw] sku
    #   @return [String] Stock Keeping Unit identification code.
    # attr_accessor :sku
    # @!attribute [rw] active
    #   @return [Boolean] Indicator of whether the product is active. Line items cannot be created from inactive products.
    # attr_accessor :active
    # @!attribute [rw] max_discount
    #   @return [Integer] Maximum discount that can be applied to the product in percents.
    # attr_accessor :max_discount
    # @!attribute [rw] max_markup
    #   @return [Integer] Maximum markup that can be applied to the product in percents.
    # attr_accessor :max_markup
    # @!attribute [rw] cost
    #   @return [Integer] Cost of the product. Visible only to account administrators.
    # attr_accessor :cost
    # @!attribute [rw] cost_currency
    #   @return [String] Currency of the product cost, specified in 3-character currency code (ISO4217) format. Visible only to account administrators.
    # attr_accessor :cost_currency
    # @!attribute [rw] prices
    #   @return [Array<Price>] Array specifying products prices in different currencies.
    # attr_accessor :prices
  end
end
