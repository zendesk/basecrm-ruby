# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class Note < Model
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time of creation in UTC (ISO8601 format).
    # attr_reader :created_at
    # @!attribute [r] creator_id
    #   @return [Integer] Unique identifier of the user that created the note.
    # attr_reader :creator_id
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the note.
    # attr_reader :id
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update in UTC (ISO8601 format).
    # attr_reader :updated_at

    # @!attribute [rw] content
    #   @return [String] Content of the note.
    # attr_accessor :content
    # @!attribute [rw] resource_id
    #   @return [Integer] Unique identifier of the resource the note is attached to.
    # attr_accessor :resource_id
    # @!attribute [rw] resource_type
    #   @return [String] Type name of the resource the note is attached to.
    # attr_accessor :resource_type
  end
end
