# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class Lead < Model
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time of the creation in UTC (ISO8601 format).
    # attr_reader :created_at
    # @!attribute [r] creator_id
    #   @return [Integer] Unique identifier of the user who created the lead.
    # attr_reader :creator_id
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the lead.
    # attr_reader :id
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update in UTC (ISO8601 format).
    # attr_reader :updated_at

    # @!attribute [rw] address
    #   @return [Address] 
    # attr_accessor :address
    # @!attribute [rw] custom_fields
    #   @return [Hash] Custom fields are a either a single key-value pair attached to a lead or a set of key-value pairs attached to a lead. See more at [Custom Fields](/docs/rest/articles/requests#custom_fields).
    # attr_accessor :custom_fields
    # @!attribute [rw] description
    #   @return [String] Lead description.
    # attr_accessor :description
    # @!attribute [rw] email
    #   @return [String] Lead's email.
    # attr_accessor :email
    # @!attribute [rw] facebook
    #   @return [String] Lead's Facebook nickname.
    # attr_accessor :facebook
    # @!attribute [rw] fax
    #   @return [String] Lead's fax number.
    # attr_accessor :fax
    # @!attribute [rw] first_name
    #   @return [String] First name of the lead.
    # attr_accessor :first_name
    # @!attribute [rw] industry
    #   @return [String] Organization's industry.
    # attr_accessor :industry
    # @!attribute [rw] last_name
    #   @return [String] Last name of the lead. Required unless `organization_name` field is provided.
    # attr_accessor :last_name
    # @!attribute [rw] linkedin
    #   @return [String] Lead's Linkedin nickname.
    # attr_accessor :linkedin
    # @!attribute [rw] mobile
    #   @return [String] Lead's mobile phone number.
    # attr_accessor :mobile
    # @!attribute [rw] organization_name
    #   @return [String] Organization name of the lead. Required unless `last_name` field is provided.
    # attr_accessor :organization_name
    # @!attribute [rw] owner_id
    #   @return [Integer] Unique identifier of the user who currently owns the lead.
    # attr_accessor :owner_id
    # @!attribute [rw] phone
    #   @return [String] Lead's phone number.
    # attr_accessor :phone
    # @!attribute [rw] skype
    #   @return [String] Lead's Skype nickname.
    # attr_accessor :skype
    # @!attribute [rw] status
    #   @return [String] Status of the lead.
    # attr_accessor :status
    # @!attribute [rw] tags
    #   @return [Array<String>] An array of tags for a lead. See more at [Tags](/docs/rest/articles/requests#tags).
    # attr_accessor :tags
    # @!attribute [rw] title
    #   @return [String] Job title of the lead.
    # attr_accessor :title
    # @!attribute [rw] twitter
    #   @return [String] Lead's Twitter handle.
    # attr_accessor :twitter
    # @!attribute [rw] website
    #   @return [String] Lead's website.
    # attr_accessor :website
  end
end
