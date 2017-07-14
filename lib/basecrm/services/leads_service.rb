# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class LeadsService
    OPTS_KEYS_TO_PERSIST = Set[
      :address,
      :custom_fields,
      :description,
      :email,
      :facebook,
      :fax,
      :first_name,
      :industry,
      :last_name,
      :linkedin,
      :mobile,
      :organization_name,
      :owner_id,
      :phone,
      :skype,
      :source_id,
      :status,
      :tags,
      :title,
      :twitter,
      :website,
    ]

    def initialize(client)
      @client = client
    end

    # Retrieve all leads
    #
    # get '/leads'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all leads
    #
    # get '/leads'
    #
    # Returns all leads available to the user, according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [String] :"address[city]" City name.
    # @option options [String] :"address[country]" Country name.
    # @option options [String] :"address[postal_code]" Zip or Postal code
    # @option options [Integer] :creator_id User ID. Returns all leads created by that user.
    # @option options [String] :first_name First name of the lead.
    # @option options [String] :ids Comma-separated list of lead IDs to be returned in a request.
    # @option options [String] :last_name Last name of the lead.
    # @option options [String] :organization_name Organization name of the lead.
    # @option options [Integer] :owner_id User ID. Returns all leads owned by that user.
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1 and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. The default limit is *25* and the maximum number that can be returned is *100*.
    # @option options [String] :sort_by (updated_at:asc) A field to sort by. The **default** order is **ascending**. If you want to change the sort order to descending, append `:desc` to the field e.g. `sort_by=last_name:desc`.
    # @option options [String] :status Status of the lead.
    # @return [Array<Lead>] The list of Leads for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/leads", options)

      root[:items].map{ |item| Lead.new(item[:data]) }
    end


    # Create a lead
    #
    # post '/leads'
    #
    # Creates a new lead
    # A lead may represent a single individual or an organization
    #
    # @param lead [Lead, Hash] Either object of the Lead type or Hash. This object's attributes describe the object to be created.
    # @return [Lead] The resulting object represting created resource.
    def create(lead)
      validate_type!(lead)

      attributes = sanitize(lead)
      _, _, root = @client.post("/leads", attributes)

      Lead.new(root[:data])
    end


    # Retrieve a single lead
    #
    # get '/leads/{id}'
    #
    # Returns a single lead available to the user, according to the unique lead ID provided
    # If the specified lead does not exist, this query returns an error
    #
    # @param id [Integer] Unique identifier of a Lead
    # @return [Lead] Searched resource object.
    def find(id)
      _, _, root = @client.get("/leads/#{id}")

      Lead.new(root[:data])
    end


    # Update a lead
    #
    # put '/leads/{id}'
    #
    # Updates lead information
    # If the specified lead does not exist, this query returns an error
    # <figure class="notice">
    # In order to modify tags, you need to supply the entire set of tags
    # `tags` are replaced every time they are used in a request
    # </figure>
    #
    # @param lead [Lead, Hash] Either object of the Lead type or Hash. This object's attributes describe the object to be updated.
    # @return [Lead] The resulting object represting updated resource.
    def update(lead)
      validate_type!(lead)
      params = extract_params!(lead, :id)
      id = params[:id]

      attributes = sanitize(lead)
      _, _, root = @client.put("/leads/#{id}", attributes)

      Lead.new(root[:data])
    end


    # Delete a lead
    #
    # delete '/leads/{id}'
    #
    # Delete an existing lead
    # If the specified lead does not exist, this query returns an error
    # This operation cannot be undone
    #
    # @param id [Integer] Unique identifier of a Lead
    # @return [Boolean] Status of the operation.
    def destroy(id)
      status, _, _ = @client.delete("/leads/#{id}")
      status == 204
    end


  private
    def validate_type!(lead)
      raise TypeError unless lead.is_a?(Lead) || lead.is_a?(Hash)
    end

    def extract_params!(lead, *args)
      params = lead.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end

    def sanitize(lead)
      lead.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
    end
  end
end
