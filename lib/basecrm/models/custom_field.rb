module BaseCRM
  class CustomField < Model
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time of the account's creation in UTC (ISO8601 format).
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update in UTC (ISO8601 format).
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the custom field.
    # @!attribute [r] name
    #   @return [String] Name of the custom field.
    # @!attribute [r] type
    #   @return [String] Type of the custom field.
    # @!attribute [r] choices
    #   @return [Array] Represents choices that can be used for this particular custom field (applicable only for multi_select_list and list).
    # @!attribute [r] for_organisation
    #   @return [Boolean] Whether custom field should be available on Contact: Company (applicable only for resource_type=contact).
    # @!attribute [r] for_contact
    #   @return [Boolean] Whether custom field should be available on Contact: Person (applicable only for resource_type=contact).
  end
end
