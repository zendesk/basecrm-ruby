module BaseCRM
  class CustomFieldsService
    RESOURCE_TYPES = %w[lead contact deal prospect_and_customer].freeze

    def initialize(client)
      @client = client
    end

    # Retrieve custom field details for a resource type
    #
    # get '/:resource_type/custom_fields'
    #
    # Returns detailed information about your custom fields
    #
    # @return [Array] Array of CustomField
    def all(resource_type)
      raise IncorrectResourceType unless RESOURCE_TYPES.include?(resource_type)

      _, _, root = @client.get("/#{resource_type}/custom_fields", {})
      root[:items].map { |item| CustomField.new(item[:data]) }
    end

    private

    def validate_type!(custom_field)
      raise TypeError unless custom_field.is_a?(CustomField) || custom_field.is_a?(Hash)
    end

    def extract_params!(custom_field, *args)
      params = custom_field.to_h.select { |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end

    class IncorrectResourceType < StandardError; end
  end
end
