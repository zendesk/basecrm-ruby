# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class CallOutcomesService
    def initialize(client)
      @client = client
    end

    # Retrieve all call outcomes
    #
    # get '/call_outcomes'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all call outcomes
    #
    # get '/call_outcomes'
    #
    # Returns all call outcomes available to the user, according to the parameters provided
    # Call outcomes are always sorted by id in ascending order
    #
    # @param options [Hash] Search options
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. The default limit is *25* and the maximum number that can be returned at one time is *100*.
    # @return [Array<CallOutcome>] The list of CallOutcomes for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/call_outcomes", options)

      root[:items].map{ |item| CallOutcome.new(item[:data]) }
    end


  private
    def validate_type!(call_outcome)
      raise TypeError unless call_outcome.is_a?(CallOutcome) || call_outcome.is_a?(Hash)
    end

    def extract_params!(call_outcome, *args)
      params = call_outcome.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end
  end
end
