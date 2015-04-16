# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class User < Model
    # @!attribute [r] confirmed
    #   @return [Boolean] Indicates whether the user's account has been confirmed or not.
    # attr_reader :confirmed
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time of creation in UTC (ISO8601 format).
    # attr_reader :created_at
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the user.
    # attr_reader :id
    # @!attribute [r] role
    #   @return [String] Role of the user.
    # attr_reader :role
    # @!attribute [r] status
    #   @return [String] Status of the user's account. Usually `active`.
    # attr_reader :status
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update in UTC (ISO8601 format).
    # attr_reader :updated_at

    # @!attribute [rw] email
    #   @return [String] Email address of the user.
    # attr_accessor :email
    # @!attribute [rw] name
    #   @return [String] Full name of the user.
    # attr_accessor :name
  end
end
