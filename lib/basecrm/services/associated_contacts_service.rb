# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class AssociatedContactsService
    OPTS_KEYS_TO_PERSIST = Set[:contact_id, :role]

    def initialize(client)
      @client = client
    end

    # Retrieve deal's associated contacts
    #
    # get '/deals/{deal_id}/associated_contacts'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all(deal_id)
      PaginatedResource.new(self, deal_id)
    end

    # Retrieve deal's associated contacts
    #
    # get '/deals/{deal_id}/associated_contacts'
    #
    # Returns all deal associated contacts
    #
    # @param deal_id [Integer] Unique identifier of a Deal
    # @param options [Hash] Search options
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. Default limit is *25* and the maximum number that can be returned is *100*.
    # @return [Array<AssociatedContact>] The list of AssociatedContacts for the first page, unless otherwise specified.
    def where(deal_id, options = {})
      _, _, root = @client.get("/deals/#{deal_id}/associated_contacts", options)

      root[:items].map{ |item| AssociatedContact.new(item[:data]) }
    end


    # Create an associated contact
    #
    # post '/deals/{deal_id}/associated_contacts'
    #
    # Creates a deal's associated contact and its role
    # If the specified deal or contact does not exist, the request will return an error
    #
    # @param deal_id [Integer] Unique identifier of a Deal
    # @param associated_contact [AssociatedContact, Hash] Either object of the AssociatedContact type or Hash. This object's attributes describe the object to be created.
    # @return [AssociatedContact] The resulting object represting created resource.
    def create(deal_id, associated_contact)
      validate_type!(associated_contact)

      attributes = sanitize(associated_contact)
      _, _, root = @client.post("/deals/#{deal_id}/associated_contacts", attributes)

      AssociatedContact.new(root[:data])
    end


    # Remove an associated contact
    #
    # delete '/deals/{deal_id}/associated_contacts/{contact_id}'
    #
    # Remove a deal's associated contact
    # If a deal with the supplied unique identifier does not exist, it returns an error
    # This operation cannot be undone
    #
    # @param deal_id [Integer] Unique identifier of a Deal
    # @param contact_id [Integer] Unique identifier of a Contact
    # @return [Boolean] Status of the operation.
    def destroy(deal_id, contact_id)
      status, _, _ = @client.delete("/deals/#{deal_id}/associated_contacts/#{contact_id}")
      status == 204
    end


  private
    def validate_type!(associated_contact)
      raise TypeError unless associated_contact.is_a?(AssociatedContact) || associated_contact.is_a?(Hash)
    end

    def extract_params!(associated_contact, *args)
      params = associated_contact.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end

    def sanitize(associated_contact)
      associated_contact.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
    end
  end
end
