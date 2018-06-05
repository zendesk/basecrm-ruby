# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class LeadUnqualifiedReasonsService
    def initialize(client)
      @client = client
    end

    # Retrieve all lead unqualified reasons
    #
    # get '/lead_unqualified_reasons'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all lead unqualified reasons
    #
    # get '/lead_unqualified_reasons'
    #
    # Returns all lead unqualified reasons available to the user according to the parameters provided
    #
    # @param options [Hash] Search options
    # @return [Array<LeadUnqualifiedReason>] The list of LeadUnqualifiedReasons for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/lead_unqualified_reasons", options)

      root[:items].map{ |item| LeadUnqualifiedReason.new(item[:data]) }
    end


  private
    def validate_type!(lead_unqualified_reason)
      raise TypeError unless lead_unqualified_reason.is_a?(LeadUnqualifiedReason) || lead_unqualified_reason.is_a?(Hash)
    end

    def extract_params!(lead_unqualified_reason, *args)
      params = lead_unqualified_reason.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end
  end
end
