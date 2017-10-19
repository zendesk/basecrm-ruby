# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class OrdersService
    OPTS_KEYS_TO_PERSIST = Set[:deal_id, :discount]

    def initialize(client)
      @client = client
    end

    # Retrieve all orders
    #
    # get '/orders'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all orders
    #
    # get '/orders'
    #
    # Returns all orders available to the user according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [String] :ids Comma-separated list of order IDs to be returned in a request.
    # @option options [Integer] :deal_id ID of the deal order is associated to.
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. Default limit is *25* and the maximum number that can be returned is *100*.
    # @option options [String] :sort_by (id:asc) A field to sort by. **Default** ordering is **ascending**. If you want to change the sort ordering to descending, append `:desc` to the field e.g. `sort_by=value:desc`.
    # @return [Array<Order>] The list of Orders for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/orders", options)

      root[:items].map{ |item| Order.new(item[:data]) }
    end


    # Create an order
    #
    # post '/orders'
    #
    # Create a new order for a deal
    # User needs to have access to the deal to create an order
    # Each deal can have at most one order and error is returned when attempting to create more
    #
    # @param order [Order, Hash] Either object of the Order type or Hash. This object's attributes describe the object to be created.
    # @return [Order] The resulting object represting created resource.
    def create(order)
      validate_type!(order)

      attributes = sanitize(order)
      _, _, root = @client.post("/orders", attributes)

      Order.new(root[:data])
    end


    # Retrieve a single order
    #
    # get '/orders/{id}'
    #
    # Returns a single order available to the user, according to the unique order ID provided
    # If the specified order does not exist, the request will return an error
    #
    # @param id [Integer] Unique identifier of a Order
    # @return [Order] Searched resource object.
    def find(id)
      _, _, root = @client.get("/orders/#{id}")

      Order.new(root[:data])
    end


    # Update an order
    #
    # put '/orders/{id}'
    #
    # Updates order information
    # If the specified order does not exist, the request will return an error
    #
    # @param order [Order, Hash] Either object of the Order type or Hash. This object's attributes describe the object to be updated.
    # @return [Order] The resulting object represting updated resource.
    def update(order)
      validate_type!(order)
      params = extract_params!(order, :id)
      id = params[:id]

      attributes = sanitize(order)
      _, _, root = @client.put("/orders/#{id}", attributes)

      Order.new(root[:data])
    end


    # Delete an order
    #
    # delete '/orders/{id}'
    #
    # Delete an existing order and remove all of the associated line items in a single call
    # If the specified order does not exist, the request will return an error
    # This operation cannot be undone
    #
    # @param id [Integer] Unique identifier of a Order
    # @return [Boolean] Status of the operation.
    def destroy(id)
      status, _, _ = @client.delete("/orders/#{id}")
      status == 204
    end


  private
    def validate_type!(order)
      raise TypeError unless order.is_a?(Order) || order.is_a?(Hash)
    end

    def extract_params!(order, *args)
      params = order.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end

    def sanitize(order)
      order.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
    end
  end
end
