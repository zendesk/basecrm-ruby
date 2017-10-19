# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class DealsService
    OPTS_KEYS_TO_PERSIST = Set[:contact_id, :currency, :custom_fields, :hot, :loss_reason_id, :name, :owner_id, :source_id, :stage_id, :tags, :value, :last_stage_change_at, :estimated_close_date, :customized_win_likelihood]

    def initialize(client)
      @client = client
    end

    # Retrieve all deals
    #
    # get '/deals'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all deals
    #
    # get '/deals'
    #
    # Returns all deals available to the user according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [Integer] :contact_id Unique identifier of a primary contact.
    # @option options [Integer] :creator_id Unique identifier of the user the deal was created by. Returns all deals created by the user.
    # @option options [Boolean] :hot Indicator of whether or not the deal is hot.
    # @option options [String] :ids Comma-separated list of deal IDs to be returned in a request.
    # @option options [Integer] :organization_id Unique identifier of an organization.
    # @option options [Integer] :owner_id Unique identifier of the user the deal is owned by. Returns all deals owned by the user.
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. Default limit is *25* and the maximum number that can be returned is *100*.
    # @option options [String] :sort_by (id:asc) A field to sort by. **Default** ordering is **ascending**. If you want to change the sort ordering to descending, append `:desc` to the field e.g. `sort_by=value:desc`.
    # @option options [Integer] :source_id Id of the Source.
    # @option options [Integer] :stage_id Id of the Stage.
    # @option options [String] :estimated_close_date of the deal.
    # @return [Array<Deal>] The list of Deals for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/deals", options)

      root[:items].map{ |item| Deal.new(item[:data]) }
    end


    # Create a deal
    #
    # post '/deals'
    #
    # Create a new deal
    #
    # @param deal [Deal, Hash] Either object of the Deal type or Hash. This object's attributes describe the object to be created.
    # @return [Deal] The resulting object represting created resource.
    def create(deal)
      validate_type!(deal)

      attributes = sanitize(deal)
      _, _, root = @client.post("/deals", attributes)

      Deal.new(root[:data])
    end


    # Retrieve a single deal
    #
    # get '/deals/{id}'
    #
    # Returns a single deal available to the user, according to the unique deal ID provided
    # If the specified deal does not exist, the request will return an error
    #
    # @param id [Integer] Unique identifier of a Deal
    # @return [Deal] Searched resource object.
    def find(id)
      _, _, root = @client.get("/deals/#{id}")

      Deal.new(root[:data])
    end


    # Update a deal
    #
    # put '/deals/{id}'
    #
    # Updates deal information
    # If the specified deal does not exist, the request will return an error
    # <figure class="notice">
    # In order to modify tags used on a record, you need to supply the entire set
    # `tags` are replaced every time they are used in a request
    # </figure>
    #
    # @param deal [Deal, Hash] Either object of the Deal type or Hash. This object's attributes describe the object to be updated.
    # @return [Deal] The resulting object represting updated resource.
    def update(deal)
      validate_type!(deal)
      params = extract_params!(deal, :id)
      id = params[:id]

      attributes = sanitize(deal)
      _, _, root = @client.put("/deals/#{id}", attributes)

      Deal.new(root[:data])
    end


    # Delete a deal
    #
    # delete '/deals/{id}'
    #
    # Delete an existing deal and remove all of the associated contacts from the deal in a single call
    # If the specified deal does not exist, the request will return an error
    # This operation cannot be undone
    #
    # @param id [Integer] Unique identifier of a Deal
    # @return [Boolean] Status of the operation.
    def destroy(id)
      status, _, _ = @client.delete("/deals/#{id}")
      status == 204
    end


  private
    def validate_type!(deal)
      raise TypeError unless deal.is_a?(Deal) || deal.is_a?(Hash)
    end

    def extract_params!(deal, *args)
      params = deal.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end

    def sanitize(deal)
      deal_hash = deal.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
      deal_hash[:value] = Coercion.to_string(deal_hash[:value])
      deal_hash
    end
  end
end
