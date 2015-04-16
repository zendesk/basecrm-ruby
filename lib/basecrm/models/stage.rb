# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class Stage < Model
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time of creation in UTC ISO8601 format.
    # attr_reader :created_at
    # @!attribute [r] id
    #   @return [Integer] The unique identifier of the stage.
    # attr_reader :id
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of last update in UTC ISO8601 format.
    # attr_reader :updated_at

    # @!attribute [rw] active
    #   @return [Boolean] Indicator whether or not the stage contains finalized deals.
    # attr_accessor :active
    # @!attribute [rw] category
    #   @return [String] The unique category name of the stage.
    # attr_accessor :category
    # @!attribute [rw] likelihood
    #   @return [Integer] The likelihood that a deal will be won, set for the stage as percentage.
    # attr_accessor :likelihood
    # @!attribute [rw] name
    #   @return [String] Human-friendly name of the stage.
    # attr_accessor :name
    # @!attribute [rw] pipeline_id
    #   @return [Integer] Unique identifier of the pipeline that contains this stage.
    # attr_accessor :pipeline_id
    # @!attribute [rw] position
    #   @return [Integer] The stage's position in the pipeline.
    # attr_accessor :position
  end
end
