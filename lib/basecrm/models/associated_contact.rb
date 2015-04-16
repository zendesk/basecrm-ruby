# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class AssociatedContact < Model
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time that the associated contact was created in UTC (ISO8601 format).
    # attr_reader :created_at
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update on the associated contact in UTC (ISO8601 format).
    # attr_reader :updated_at

    # @!attribute [rw] contact_id
    #   @return [Integer] Unique identifier of the contact to be associated with the deal.
    # attr_accessor :contact_id
    # @!attribute [rw] role
    #   @return [String] Role name.
    # attr_accessor :role
  end
end
