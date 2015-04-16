# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class LossReasonsService
    OPTS_KEYS_TO_PERSIST = Set[:name]

    def initialize(client)
      @client = client
    end

    # Retrieve all reasons
    # 
    # get '/loss_reasons'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources. 
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all reasons
    # 
    # get '/loss_reasons'
    #
    # Returns all deal loss reasons available to the user according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [String] :ids Comma separated list of deal loss reasons unique identifiers to be returned in a request.
    # @option options [String] :name Name of the loss reason to search for. This parameter is used in a strict sense.
    # @option options [Integer] :page (1) Page number to start from. Page numbering is 1-based and omitting `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. Default limit is *25* and maximum number that can be returned is *100*.
    # @option options [String] :sort_by (id:asc) A field to sort by. **Default** ordering is **ascending**. If you want to change the sort ordering to descending, append `:desc` to the field e.g. `sort_by=name:desc`.
    # @return [Array<LossReason>] The list of LossReasons for the first page, unless otherwise specified. 
    def where(options = {})
      _, _, root = @client.get("/loss_reasons", options)

      root[:items].map{ |item| LossReason.new(item[:data]) }
    end
    

    # Create a loss reason
    # 
    # post '/loss_reasons'
    #
    # Create a new loss reason
    # <figure class="notice">
    # Loss reason's name **must** be unique
    # </figure>
    #
    # @param loss_reason [LossReason, Hash] Either object of the LossReason type or Hash. This object's attributes describe the object to be created. 
    # @return [LossReason] The resulting object represting created resource. 
    def create(loss_reason)
      validate_type!(loss_reason)

      attributes = sanitize(loss_reason)
      _, _, root = @client.post("/loss_reasons", attributes)

      LossReason.new(root[:data])
    end
    

    # Retrieve a single reason
    # 
    # get '/loss_reasons/{id}'
    #
    # Returns a single loss reason available to the user by the provided id
    # If a loss reason with the supplied unique identifier does not exist, it returns an error
    #
    # @param id [Integer] Unique identifier of a LossReason
    # @return [LossReason] Searched resource object. 
    def find(id)
      _, _, root = @client.get("/loss_reasons/#{id}")

      LossReason.new(root[:data])
    end
    

    # Update a loss reason
    # 
    # put '/loss_reasons/{id}'
    #
    # Updates a loss reason information
    # If the specified loss reason does not exist, the request will return an error
    # <figure class="notice">
    # If you want to update loss reason you **must** make sure name of the reason is unique
    # </figure>
    #
    # @param loss_reason [LossReason, Hash] Either object of the LossReason type or Hash. This object's attributes describe the object to be updated. 
    # @return [LossReason] The resulting object represting updated resource. 
    def update(loss_reason)
      validate_type!(loss_reason)
      params = extract_params!(loss_reason, :id)
      id = params[:id]

      attributes = sanitize(loss_reason)
      _, _, root = @client.put("/loss_reasons/#{id}", attributes)

      LossReason.new(root[:data])
    end
    

    # Delete a reason
    # 
    # delete '/loss_reasons/{id}'
    #
    # Delete an existing loss reason
    # If the reason with supplied unique identifier does not exist it returns an error
    # This operation cannot be undone
    #
    # @param id [Integer] Unique identifier of a LossReason
    # @return [Boolean] Status of the operation.
    def destroy(id)
      status, _, _ = @client.delete("/loss_reasons/#{id}")
      status == 204
    end
    

  private
    def validate_type!(loss_reason)
      raise TypeError unless loss_reason.is_a?(LossReason) || loss_reason.is_a?(Hash)
    end

    def extract_params!(loss_reason, *args)
      params = loss_reason.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end
       
    def sanitize(loss_reason)
      loss_reason.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
    end
  end
end
