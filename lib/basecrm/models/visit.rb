# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class Visit < Model
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time of creation in UTC (ISO8601 format).
    # attr_reader :created_at
    # @!attribute [r] creator_id
    #   @return [Integer] Unique identifier of a user who created a visit.
    # attr_reader :creator_id
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of a visit.
    # attr_reader :id
    # @!attribute [r] outcome_id
    #   @return [Integer] Unique identifier of a visit outcome.
    # attr_reader :outcome_id
    # @!attribute [r] rep_location_verification_status
    #   @return [String] The status of the location verification of the device that created the visit (sales representative).
    # attr_reader :rep_location_verification_status
    # @!attribute [r] resource_address
    #   @return [String] Address of the visit
    # attr_reader :resource_address
    # @!attribute [r] resource_id
    #   @return [Integer] The ID of the resource the visit is attached to. Requires the resource_type query param to be set as well.
    # attr_reader :resource_id
    # @!attribute [r] resource_type
    #   @return [String] The type of the resource the visit is attached to.
    # attr_reader :resource_type
    # @!attribute [r] summary
    #   @return [String] Summary of the visit.
    # attr_reader :summary
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update in UTC (ISO8601 format).
    # attr_reader :updated_at

  end
end
