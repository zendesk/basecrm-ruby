# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class ProductsService
    OPTS_KEYS_TO_PERSIST = Set[:name, :sku, :active, :cost, :cost_currency, :prices]

    def initialize(client)
      @client = client
    end

    # Retrieve all products
    # 
    # get '/products'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources. 
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all products
    # 
    # get '/products'
    #
    # Returns all products available to the user according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [String] :ids Comma-separated list of product IDs to be returned in a request.
    # @option options [Integer] :organization_id Unique identifier of an organization.
    # @option options [Integer] :owner_id Unique identifier of the user the product is owned by. Returns all products owned by the user.
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. Default limit is *25* and the maximum number that can be returned is *100*.
    # @option options [String] :sort_by (id:asc) A field to sort by. **Default** ordering is **ascending**. If you want to change the sort ordering to descending, append `:desc` to the field e.g. `sort_by=value:desc`.
    # @option options [String] :name Name of the product.
    # @option options [String] :sku SKU of the product.
    # @option options [Boolean] :active Indicator of whether or not the product is active.
    # @return [Array<Product>] The list of Products for the first page, unless otherwise specified. 
    def where(options = {})
      _, _, root = @client.get("/products", options)

      root[:items].map{ |item| Product.new(item[:data]) }
    end
    

    # Create a product
    # 
    # post '/products'
    #
    # Create a new product
    #
    # @param product [Product, Hash] Either object of the Product type or Hash. This object's attributes describe the object to be created. 
    # @return [Product] The resulting object represting created resource. 
    def create(product)
      validate_type!(product)

      attributes = sanitize(product)
      _, _, root = @client.post("/products", attributes)

      Product.new(root[:data])
    end
    

    # Retrieve a single product
    # 
    # get '/products/{id}'
    #
    # Returns a single product, according to the unique product ID provided
    # If the specified product does not exist, the request will return an error
    #
    # @param id [Integer] Unique identifier of a Product
    # @return [Product] Searched resource object. 
    def find(id)
      _, _, root = @client.get("/products/#{id}")

      Product.new(root[:data])
    end
    

    # Update a product
    # 
    # put '/products/{id}'
    #
    # Updates product information
    # If the specified product does not exist, the request will return an error
    # <figure class="notice"><p>In order to modify prices used on a record, you need to supply the entire set
    # <code>prices</code> are replaced every time they are used in a request
    # </p></figure>
    #
    # @param product [Product, Hash] Either object of the Product type or Hash. This object's attributes describe the object to be updated. 
    # @return [Product] The resulting object represting updated resource. 
    def update(product)
      validate_type!(product)
      params = extract_params!(product, :id)
      id = params[:id]

      attributes = sanitize(product)
      _, _, root = @client.put("/products/#{id}", attributes)

      Product.new(root[:data])
    end
    

    # Delete a product
    # 
    # delete '/products/{id}'
    #
    # Delete an existing product from the catalog
    # Existing orders and line items are not affected
    # If the specified product does not exist, the request will return an error
    # This operation cannot be undone
    # Products can be removed only by an account administrator
    #
    # @param id [Integer] Unique identifier of a Product
    # @return [Boolean] Status of the operation.
    def destroy(id)
      status, _, _ = @client.delete("/products/#{id}")
      status == 204
    end
    

  private
    def validate_type!(product)
      raise TypeError unless product.is_a?(Product) || product.is_a?(Hash)
    end

    def extract_params!(product, *args)
      params = product.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end
       
    def sanitize(product)
      product.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
    end
  end
end
