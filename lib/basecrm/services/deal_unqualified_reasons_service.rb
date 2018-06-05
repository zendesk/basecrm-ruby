# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class DealUnqualifiedReasonsService
    OPTS_KEYS_TO_PERSIST = Set[:name]

    def initialize(client)
      @client = client
    end

    # Retrieve all deal unqualified reasons
    #
    # get '/deal_unqualified_reasons'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all deal unqualified reasons
    #
    # get '/deal_unqualified_reasons'
    #
    # Returns all deal unqualified reasons available to the user according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [String] :ids Comma separated list of deal unqualified reasons unique identifiers to be returned in a request.
    # @option options [String] :name Name of the deal unqualified reason to search for. This parameter is used in a strict sense.
    # @option options [Integer] :page (1) Page number to start from. Page numbering is 1-based and omitting `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. Default limit is *25* and maximum number that can be returned is *100*.
    # @option options [String] :sort_by (id:asc) A field to sort by. **Default** ordering is **ascending**. If you want to change the sort ordering to descending, append `:desc` to the field e.g. `sort_by=name:desc`.
    # @return [Array<DealUnqualifiedReason>] The list of DealUnqualifiedReasons for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/deal_unqualified_reasons", options)

      root[:items].map{ |item| DealUnqualifiedReason.new(item[:data]) }
    end


    # Create a deal unqualified reason
    #
    # post '/deal_unqualified_reasons'
    #
    # Create a new deal unqualified reason
    # <figure class="notice">
    # Deal unqualified reason's name **must** be unique
    # </figure>
    #
    # @param deal_unqualified_reason [DealUnqualifiedReason, Hash] Either object of the DealUnqualifiedReason type or Hash. This object's attributes describe the object to be created.
    # @return [DealUnqualifiedReason] The resulting object represting created resource.
    def create(deal_unqualified_reason)
      validate_type!(deal_unqualified_reason)

      attributes = sanitize(deal_unqualified_reason)
      _, _, root = @client.post("/deal_unqualified_reasons", attributes)

      DealUnqualifiedReason.new(root[:data])
    end


    # Retrieve a single deal unqualified reason
    #
    # get '/deal_unqualified_reasons/{id}'
    #
    # Returns a single deal unqualified reason available to the user by the provided id
    # If a loss reason with the supplied unique identifier does not exist, it returns an error
    #
    # @param id [Integer] Unique identifier of a DealUnqualifiedReason
    # @return [DealUnqualifiedReason] Searched resource object.
    def find(id)
      _, _, root = @client.get("/deal_unqualified_reasons/#{id}")

      DealUnqualifiedReason.new(root[:data])
    end


    # Update a deal unqualified reason
    #
    # put '/deal_unqualified_reasons/{id}'
    #
    # Updates a deal unqualified reason information
    # If the specified deal unqualified reason does not exist, the request will return an error
    # <figure class="notice">
    # If you want to update deal unqualified reason you **must** make sure name of the reason is unique
    # </figure>
    #
    # @param deal_unqualified_reason [DealUnqualifiedReason, Hash] Either object of the DealUnqualifiedReason type or Hash. This object's attributes describe the object to be updated.
    # @return [DealUnqualifiedReason] The resulting object represting updated resource.
    def update(deal_unqualified_reason)
      validate_type!(deal_unqualified_reason)
      params = extract_params!(deal_unqualified_reason, :id)
      id = params[:id]

      attributes = sanitize(deal_unqualified_reason)
      _, _, root = @client.put("/deal_unqualified_reasons/#{id}", attributes)

      DealUnqualifiedReason.new(root[:data])
    end


    # Delete a deal unqualified reason
    #
    # delete '/deal_unqualified_reasons/{id}'
    #
    # Delete an existing deal unqualified reason
    # If the reason with supplied unique identifier does not exist it returns an error
    # This operation cannot be undone
    #
    # @param id [Integer] Unique identifier of a DealUnqualifiedReason
    # @return [Boolean] Status of the operation.
    def destroy(id)
      status, _, _ = @client.delete("/deal_unqualified_reasons/#{id}")
      status == 204
    end


  private
    def validate_type!(deal_unqualified_reason)
      raise TypeError unless deal_unqualified_reason.is_a?(DealUnqualifiedReason) || deal_unqualified_reason.is_a?(Hash)
    end

    def extract_params!(deal_unqualified_reason, *args)
      params = deal_unqualified_reason.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end

    def sanitize(deal_unqualified_reason)
      deal_unqualified_reason.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
    end
  end
end
