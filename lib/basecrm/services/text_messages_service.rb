# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class TextMessagesService
    def initialize(client)
      @client = client
    end

    # Retrieve text messages
    #
    # get '/text_messages'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve text messages
    #
    # get '/text_messages'
    #
    # Returns Text Messages, according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. The default limit is *25* and the maximum number that can be returned at one time is *100*.
    # @option options [String] :ids Comma-separated list of text message IDs to be returned in request.
    # @option options [Integer] :resource_id Unique identifier of a resource the text message is attached to. Requires also resource_type to be specified.
    # @option options [String] :resource_type Name of a resource type the text message is attached to. Requires also resource_id to be specified.
    # @option options [String] :sort_by (id:desc) Comma-separated list of fields to sort by. The sort criteria is applied in the order specified. The **default** ordering is **descending**. If you want to change the sort ordering to ascending, append `:asc` to the field e.g. `sort_by=id:asc`
    # @return [Array<TextMessage>] The list of TextMessages for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/text_messages", options)

      root[:items].map{ |item| TextMessage.new(item[:data]) }
    end


    # Retrieve a single text message
    #
    # get '/text_messages/{id}'
    #
    # Returns a single text message according to the unique  ID provided
    # If the specified user does not exist, this query returns an error
    #
    # @param id [Integer] Unique identifier of a TextMessage
    # @return [TextMessage] Searched resource object.
    def find(id)
      _, _, root = @client.get("/text_messages/#{id}")

      TextMessage.new(root[:data])
    end


  private
    def validate_type!(text_message)
      raise TypeError unless text_message.is_a?(TextMessage) || text_message.is_a?(Hash)
    end

    def extract_params!(text_message, *args)
      params = text_message.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end
  end
end
