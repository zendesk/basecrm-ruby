# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class LeadSource < Model
    # @!attribute [r] created_at
    #   @return [String] Date and time of creation in UTC (ISO 8601 format).
    # attr_reader :created_at
    # @!attribute [r] creator_id
    #   @return [Integer] Unique identifier of the user that created the source.
    # attr_reader :creator_id
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the lead source.
    # attr_reader :id
    # @!attribute [r] updated_at
    #   @return [String] Date and time of the last update in UTC (ISO 8601 format).
    # attr_reader :updated_at

    # @!attribute [rw] name
    #   @return [String] Name of the source.
    # attr_accessor :name
    # @!attribute [rw] resource_type
    #   @return [String] Type name of the resource the source is attached to. Possible values: lead
    # attr_accessor :resource_type
  end
end
