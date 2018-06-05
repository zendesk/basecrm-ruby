# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class LeadUnqualifiedReason < Model
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time of creation in UTC ISO8601 format.
    # attr_reader :created_at
    # @!attribute [r] creator_id
    #   @return [Integer] Unique identifier of the user the lead unqualified reason was created by.
    # attr_reader :creator_id
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the lead unqualified reason.
    # attr_reader :id
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update in UTC ISO8601 format.
    # attr_reader :updated_at

    # @!attribute [rw] name
    #   @return [String] Human-friendly unqualified reason explanation.
    # attr_accessor :name
  end
end
