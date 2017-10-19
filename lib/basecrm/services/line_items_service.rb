# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class LineItemsService
    OPTS_KEYS_TO_PERSIST = Set[:product_id, :value, :variation, :currency, :quantity]

    def initialize(client)
      @client = client
    end

    # Retrieve order's line items
    #
    # get '/orders/{order_id}/line_items'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all(order_id)
      PaginatedResource.new(self, order_id)
    end

    # Retrieve order's line items
    #
    # get '/orders/{order_id}/line_items'
    #
    # Returns all line items associated to order
    #
    # @param order_id [Integer] Unique identifier of a Order
    # @param options [Hash] Search options
    # @option options [String] :ids Comma-separated list of line item IDs to be returned in a request.
    # @option options [Integer] :quantity Quantity of line item.
    # @option options [Integer] :value Value of line item.
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. Default limit is *25* and the maximum number that can be returned is *100*.
    # @option options [String] :sort_by (id:asc) A field to sort by. **Default** ordering is **ascending**. If you want to change the sort ordering to descending, append `:desc` to the field e.g. `sort_by=value:desc`.
    # @return [Array<LineItem>] The list of LineItems for the first page, unless otherwise specified.
    def where(order_id, options = {})
      _, _, root = @client.get("/orders/#{order_id}/line_items", options)

      root[:items].map{ |item| LineItem.new(item[:data]) }
    end


    # Create a line item
    #
    # post '/orders/{order_id}/line_items'
    #
    # Adds a new line item to an existing order
    # Line items correspond to products in the catalog, so first you must create products
    # Because products allow defining different prices in different currencies, when creating a line item, the parameter currency is required
    #
    # @param order_id [Integer] Unique identifier of a Order
    # @param line_item [LineItem, Hash] Either object of the LineItem type or Hash. This object's attributes describe the object to be created.
    # @return [LineItem] The resulting object represting created resource.
    def create(order_id, line_item)
      validate_type!(line_item)

      attributes = sanitize(line_item)
      _, _, root = @client.post("/orders/#{order_id}/line_items", attributes)

      LineItem.new(root[:data])
    end


    # Retrieve a single line item
    #
    # get '/orders/{order_id}/line_items/{id}'
    #
    # Returns a single line item of an order, according to the unique line item ID provided
    #
    # @param order_id [Integer] Unique identifier of a Order
    # @param id [Integer] Unique identifier of a LineItem
    # @return [LineItem] Searched resource object.
    def find(order_id, id)
      _, _, root = @client.get("/orders/#{order_id}/line_items/#{id}")

      LineItem.new(root[:data])
    end


    # Delete a line item
    #
    # delete '/orders/{order_id}/line_items/{id}'
    #
    # Remove an order’s line item
    # This operation cannot be undone
    #
    # @param order_id [Integer] Unique identifier of a Order
    # @param id [Integer] Unique identifier of a LineItem
    # @return [Boolean] Status of the operation.
    def destroy(order_id, id)
      status, _, _ = @client.delete("/orders/#{order_id}/line_items/#{id}")
      status == 204
    end


  private
    def validate_type!(line_item)
      raise TypeError unless line_item.is_a?(LineItem) || line_item.is_a?(Hash)
    end

    def extract_params!(line_item, *args)
      params = line_item.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end

    def sanitize(line_item)
      line_item.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
    end
  end
end
