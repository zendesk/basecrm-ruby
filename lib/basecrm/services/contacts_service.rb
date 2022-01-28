# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class ContactsService
    OPTS_KEYS_TO_PERSIST = Set[:address, :contact_id, :custom_fields, :customer_status, :description, :email, :facebook, :fax, :first_name, :industry, :is_organization, :last_name, :linkedin, :mobile, :name, :owner_id, :phone, :prospect_status, :skype, :tags, :title, :twitter, :website]

    def initialize(client)
      @client = client
    end

    # Retrieve all contacts
    #
    # get '/contacts'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all contacts
    #
    # get '/contacts'
    #
    # Returns all contacts available to the user according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [String] :"address[city]" City name.
    # @option options [String] :"address[country]" Country name.
    # @option options [String] :"address[postal_code]" Zip code or equivalent
    # @option options [Integer] :contact_id The unique identifier of the organization that the contact belongs to.
    # @option options [String] :email Email address of the contact.
    # @option options [String] :first_name First name of the contact.
    # @option options [String] :ids Comma-separated list of the IDs for the contacts you want to be returned in your request.
    # @option options [Boolean] :is_organization Indicates whether or not this contact refers to an organization or an individual.
    # @option options [String] :last_name Last name of the contact.
    # @option options [String] :name Name of the contact.
    # @option options [Integer] :page (1) The page number to start from. Page numbering is 1-based and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) The number of records to return per page. Default limit is *25* and maximum number that can be returned is *100*.
    # @option options [String] :sort_by (last_name:asc) A field to sort by. **Default** ordering is **ascending**. If you want to change the sort order to descending, append `:desc` to the field e.g. `sort_by=last_name:desc`.
    # @return [Array<Contact>] The list of Contacts for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/contacts", options)

      root[:items].map{ |item| Contact.new(item[:data]) }
    end


    # Create a contact
    #
    # post '/contacts'
    #
    # Create a new contact
    # A contact may represent a single individual or an organization
    #
    # @param contact [Contact, Hash] Either object of the Contact type or Hash. This object's attributes describe the object to be created.
    # @return [Contact] The resulting object represting created resource.
    def create(contact)
      validate_type!(contact)

      attributes = sanitize(contact)
      _, _, root = @client.post("/contacts", attributes)

      Contact.new(root[:data])
    end


    # Retrieve a single contact
    #
    # get '/contacts/{id}'
    #
    # Returns a single contact available to the user, according to the unique contact ID provided
    # If the specified contact does not exist, the request will return an error
    #
    # @param id [Integer] Unique identifier of a Contact
    # @return [Contact] Searched resource object.
    def find(id)
      _, _, root = @client.get("/contacts/#{id}")

      Contact.new(root[:data])
    end


    # Update a contact
    #
    # put '/contacts/{id}'
    #
    # Updates contact information
    # If the specified contact does not exist, the request will return an error
    # **Notice** When updating contact tags, you need to provide all tags
    # Any missing tag will be removed from a contact's tags
    #
    # @param contact [Contact, Hash] Either object of the Contact type or Hash. This object's attributes describe the object to be updated.
    # @return [Contact] The resulting object represting updated resource.
    def update(contact)
      validate_type!(contact)
      params = extract_params!(contact, :id)
      id = params[:id]

      attributes = sanitize(contact)
      _, _, root = @client.put("/contacts/#{id}", attributes)

      Contact.new(root[:data])
    end

    # Upsert a contact
    #
    # post '/contacts/upsert?filter_param=filter_value 
    #
    # Create a new contact or update an existing, based on a value of a filter or a set of filters. 
    # At least a single filter - query parameter - is required. If no parameters are present, the request will return an error.
    # See full docs https://developers.getbase.com/docs/rest/reference/contacts
    #
    # @param filters [Hash] - hash contain filters, one level deep e.g. { name: 'string', 'custom_fields[field]': 'value' }
    # @param contact [Contact, Hash] - This object's attributes describe the object to be updated or created
    # @return [Contact] The resulting object representing updated or created resource.
    def upsert(filters, deal)
      validate_upsert_filters!(filters)
      validate_type!(contact)

      attributes = sanitize(contact)
      query_string = URI.encode_www_form(filters)
      _, _, root = @client.post("/contacts/upsert?#{query_string}", attributes)

      Contact.new(root[:data])
    end


    # Delete a contact
    #
    # delete '/contacts/{id}'
    #
    # Delete an existing contact
    # If the specified contact does not exist, the request will return an error
    # This operation cannot be undone
    #
    # @param id [Integer] Unique identifier of a Contact
    # @return [Boolean] Status of the operation.
    def destroy(id)
      status, _, _ = @client.delete("/contacts/#{id}")
      status == 204
    end


  private
    def validate_type!(contact)
      raise TypeError unless contact.is_a?(Contact) || contact.is_a?(Hash)
    end

    def validate_upsert_filters!(filters)
      raise TypeError unless filters.is_a?(Hash)
      raise ArgumentError, "at least one filter is required" if filters.empty?
    end

    def extract_params!(contact, *args)
      params = contact.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end

    def sanitize(contact)
      contact.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
    end
  end
end
