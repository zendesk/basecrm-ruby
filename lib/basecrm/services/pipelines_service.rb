# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class PipelinesService
    def initialize(client)
      @client = client
    end

    # Retrieve all pipelines
    #
    # get '/pipelines'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all pipelines
    #
    # get '/pipelines'
    #
    # Returns all pipelines available to the user, according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [String] :ids Comma-separated list of pipeline IDs to be returned in a request.
    # @option options [String] :name Name of the pipeline to search for. This parameter is used in a strict sense. Unsupported for now.
    # @option options [Integer] :page (1) The page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) The number of records to be returned per page. The default limit is *25* and the maximum number that can be returned is *100*.
    # @option options [String] :sort_by (id:asc) Comma-separated list of fields to sort by. The sort criteria is applied in the order specified. The **default** ordering is **ascending**. If you want to change the sort ordering to descending, append `:desc` to the field e.g. `sort_by=position:desc`. Unsupported for now.
    # @return [Array<Pipeline>] The list of Pipelines for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/pipelines", options)

      root[:items].map{ |item| Pipeline.new(item[:data]) }
    end


  private
    def validate_type!(pipeline)
      raise TypeError unless pipeline.is_a?(Pipeline) || pipeline.is_a?(Hash)
    end

    def extract_params!(pipeline, *args)
      params = pipeline.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end
  end
end
