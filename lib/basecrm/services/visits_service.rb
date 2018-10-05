# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class VisitsService
    def initialize(client)
      @client = client
    end

    # Retrieve visits
    #
    # get '/visits'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve visits
    #
    # get '/visits'
    #
    # Returns Visits, according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. The default limit is *25* and the maximum number that can be returned at one time is *100*.
    # @option options [Integer] :outcome_id Unique identifier of a visit outcome.
    # @option options [Integer] :creator_id Unique identifier of a user who created a visit.
    # @option options [Integer] :resource_id Unique identifier of a resource the visit is attached to. Requires also resource_type to be specified.
    # @option options [String] :resource_type Name of a resource type the visit is attached to. Requires also resource_id to be specified.
    # @option options [String] :rep_location_verification_status The status of the location verification of the device that created the visit (sales representative).
    # @option options [String] :sort_by (id:asc) A field to sort by. Default ordering is ascending. If you want to change the sort order to descending, append :desc to the filed e.g. sort_by=visited_at:desc.
    # @return [Array<Visit>] The list of Visits for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/visits", options)

      root[:items].map{ |item| Visit.new(item[:data]) }
    end


  private
    def validate_type!(visit)
      raise TypeError unless visit.is_a?(Visit) || visit.is_a?(Hash)
    end

    def extract_params!(visit, *args)
      params = visit.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end
  end
end
