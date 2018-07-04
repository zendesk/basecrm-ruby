# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class CallsService
    OPTS_KEYS_TO_PERSIST = Set[:user_id, :summary, :recording_url, :outcome_id, :duration, :phone_number, :incoming, :missed, :external_id, :resource_id, :resource_type, :associated_deal_ids, :made_at]

    def initialize(client)
      @client = client
    end

    # Retrieve all calls
    #
    # get '/calls'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all calls
    #
    # get '/calls'
    #
    # Returns all calls available to the user, according to the parameters provided
    # Calls are always sorted by made_at in descending order
    #
    # @param options [Hash] Search options
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. The default limit is *25* and the maximum number that can be returned at one time is *100*.
    # @option options [String] :ids Comma-separated list of call IDs to be returned in request.
    # @option options [Integer] :resource_id Unique identifier of the resource the call is attached to.
    # @option options [String] :resource_type Name of the resource type the call is attached to.
    # @return [Array<Call>] The list of Calls for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/calls", options)

      root[:items].map{ |item| Call.new(item[:data]) }
    end


    # Create a call
    #
    # post '/calls'
    #
    # Create a new call
    #
    # @param call [Call, Hash] Either object of the Call type or Hash. This object's attributes describe the object to be created.
    # @return [Call] The resulting object represting created resource.
    def create(call)
      validate_type!(call)

      attributes = sanitize(call)
      _, _, root = @client.post("/calls", attributes)

      Call.new(root[:data])
    end


    # Retrieve a single call
    #
    # get '/calls/{id}'
    #
    # Returns a single call available to the user, according to the unique call ID provided
    # If the specified call does not exist, this query returns an error
    #
    # @param id [Integer] Unique identifier of a Call
    # @return [Call] Searched resource object.
    def find(id)
      _, _, root = @client.get("/calls/#{id}")

      Call.new(root[:data])
    end


    # Update a call
    #
    # put '/calls/{id}'
    #
    # Allows to attach a Contact or Lead to an existing Call, or change it’s current association
    #
    # @param call [Call, Hash] Either object of the Call type or Hash. This object's attributes describe the object to be updated.
    # @return [Call] The resulting object represting updated resource.
    def update(call)
      validate_type!(call)
      params = extract_params!(call, :id)
      id = params[:id]

      attributes = sanitize(call)
      _, _, root = @client.put("/calls/#{id}", attributes)

      Call.new(root[:data])
    end


    # Delete a call
    #
    # delete '/calls/{id}'
    #
    # Delete an existing call
    # If the specified call does not exist, this query returns an error
    # This operation cannot be undone
    #
    # @param id [Integer] Unique identifier of a Call
    # @return [Boolean] Status of the operation.
    def destroy(id)
      status, _, _ = @client.delete("/calls/#{id}")
      status == 204
    end


  private
    def validate_type!(call)
      raise TypeError unless call.is_a?(Call) || call.is_a?(Hash)
    end

    def extract_params!(call, *args)
      params = call.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end

    def sanitize(call)
      call.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
    end
  end
end
