# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class Tag < Model
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time of creation in UTC (ISO8601 format).
    # attr_reader :created_at
    # @!attribute [r] creator_id
    #   @return [Integer] User ID of the tag's creator.
    # attr_reader :creator_id
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the tag.
    # attr_reader :id
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update in UTC (ISO8601 format).
    # attr_reader :updated_at

    # @!attribute [rw] name
    #   @return [String] Name of the tag.
    # attr_accessor :name
    # @!attribute [rw] resource_type
    #   @return [String] Type name of the resource the tag is attached to.
    # attr_accessor :resource_type
  end
end
