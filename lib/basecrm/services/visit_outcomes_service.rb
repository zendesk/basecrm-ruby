# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class VisitOutcomesService
    def initialize(client)
      @client = client
    end

    # Retrieve visit outcomes
    #
    # get '/visit_outcomes'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve visit outcomes
    #
    # get '/visit_outcomes'
    #
    # Returns Visit Outcomes, according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. The default limit is *25* and the maximum number that can be returned at one time is *100*.
    # @return [Array<VisitOutcome>] The list of VisitOutcomes for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/visit_outcomes", options)

      root[:items].map{ |item| VisitOutcome.new(item[:data]) }
    end


  private
    def validate_type!(visit_outcome)
      raise TypeError unless visit_outcome.is_a?(VisitOutcome) || visit_outcome.is_a?(Hash)
    end

    def extract_params!(visit_outcome, *args)
      params = visit_outcome.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end
  end
end
