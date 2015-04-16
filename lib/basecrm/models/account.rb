# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class Account < Model
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time of the account's creation in UTC (ISO8601 format).
    # attr_reader :created_at
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the account.
    # attr_reader :id
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update in UTC (ISO8601 format).
    # attr_reader :updated_at

    # @!attribute [rw] currency
    #   @return [String] Currency of the account as the 3-character currency code in ISO4217 format.
    # attr_accessor :currency
    # @!attribute [rw] name
    #   @return [String] Full name of the account.
    # attr_accessor :name
    # @!attribute [rw] phone
    #   @return [String] Contact phone number of the account.
    # attr_accessor :phone
    # @!attribute [rw] time_format
    #   @return [String] Time format used for the account. Either 12-hour clock `12H` or 24-hour clock `24H`.
    # attr_accessor :time_format
    # @!attribute [rw] timezone
    #   @return [String] Timezone of the account as the offset from Coordinated Universal Time (UTC) in the format `UTC(+|-)[hh]:[mm]`.
    # attr_accessor :timezone
  end
end
