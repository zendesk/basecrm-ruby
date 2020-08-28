module BaseCRM
  class LeadCustomFieldsService
    def initialize(client)
      @client = client
    end

    # Retrieve all lead custom fields
    #
    # get '/lead/custom_fields'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      _, _, root = @client.get("/lead/custom_fields")
      root[:items].map do |item|
        LeadCustomField.new(item[:data]).tap do |custom_field|
          if item[:data][:choices]
            custom_field.choices = item[:data][:choices].map do |choice|
              Choice.new(choice)
            end
          end
        end
      end
    end
  end
end
