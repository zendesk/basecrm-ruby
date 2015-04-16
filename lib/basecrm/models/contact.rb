# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class Contact < Model
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time that the record was created in UTC ISO8601 format.
    # attr_reader :created_at
    # @!attribute [r] creator_id
    #   @return [Integer] The unique identifier of the user the contact was created by.
    # attr_reader :creator_id
    # @!attribute [r] id
    #   @return [Integer] The unique identifier of the contact.
    # attr_reader :id
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the record's last update in UTC ISO8601 format.
    # attr_reader :updated_at

    # @!attribute [rw] address
    #   @return [Address] 
    # attr_accessor :address
    # @!attribute [rw] contact_id
    #   @return [Integer] The unique identifier of the organization the contact belongs to. The field will be set only if the contact is an individual.
    # attr_accessor :contact_id
    # @!attribute [rw] custom_fields
    #   @return [Hash] Custom fields are a key-value pair attached to a contact. See more at [Custom Fields](/docs/rest/articles/requests#custom_fields).
    # attr_accessor :custom_fields
    # @!attribute [rw] customer_status
    #   @return [String] The customer status of the contact.
    # attr_accessor :customer_status
    # @!attribute [rw] description
    #   @return [String] The contact's description.
    # attr_accessor :description
    # @!attribute [rw] email
    #   @return [String] The contact's email address.
    # attr_accessor :email
    # @!attribute [rw] facebook
    #   @return [String] The contact's Facebook nickname.
    # attr_accessor :facebook
    # @!attribute [rw] fax
    #   @return [String] The contact's fax number.
    # attr_accessor :fax
    # @!attribute [rw] first_name
    #   @return [String] First name of the contact.
    # attr_accessor :first_name
    # @!attribute [rw] industry
    #   @return [String] The contact's industry.
    # attr_accessor :industry
    # @!attribute [rw] is_organization
    #   @return [Boolean] Indicator of whether or not this contact refers to an organization or an individual. This value can be set **only** during creation and **cannot** be changed later. The default value is `false`.
    # attr_accessor :is_organization
    # @!attribute [rw] last_name
    #   @return [String] Last name of the contact. Required only if the contact is an individual.
    # attr_accessor :last_name
    # @!attribute [rw] linkedin
    #   @return [String] The contact's Linkedin nickname.
    # attr_accessor :linkedin
    # @!attribute [rw] mobile
    #   @return [String] The contact's mobile phone number.
    # attr_accessor :mobile
    # @!attribute [rw] name
    #   @return [String] Name of the contact. Required only if the contact is an organization.
    # attr_accessor :name
    # @!attribute [rw] owner_id
    #   @return [Integer] The unique identifier of the user the contact is currently assigned to.
    # attr_accessor :owner_id
    # @!attribute [rw] phone
    #   @return [String] The contact's phone number.
    # attr_accessor :phone
    # @!attribute [rw] prospect_status
    #   @return [String] The prospect status of the contact.
    # attr_accessor :prospect_status
    # @!attribute [rw] skype
    #   @return [String] The contact's Skype nickname.
    # attr_accessor :skype
    # @!attribute [rw] tags
    #   @return [Array<String>] An array of tags for the contact. See more at [Tags](/docs/rest/articles/requests#tags).
    # attr_accessor :tags
    # @!attribute [rw] title
    #   @return [String] The contact's job title.
    # attr_accessor :title
    # @!attribute [rw] twitter
    #   @return [String] The contact's Twitter handle.
    # attr_accessor :twitter
    # @!attribute [rw] website
    #   @return [String] The contact's website address.
    # attr_accessor :website
  end
end
