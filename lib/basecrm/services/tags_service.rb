# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class TagsService
    OPTS_KEYS_TO_PERSIST = Set[:name, :resource_type]

    def initialize(client)
      @client = client
    end

    # Retrieve all tags
    # 
    # get '/tags'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources. 
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all tags
    # 
    # get '/tags'
    #
    # Returns all tags available to the user, according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [Integer] :creator_id User ID. Returns all tags created by that user.
    # @option options [String] :ids Comma-separated list of deal tag IDs to be returned in a request.
    # @option options [String] :name Name of the tag to search for. This parameter is used in a strict sense.
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. The default limit is *25* and the maximum number that can be returned is *100*.
    # @option options [String] :resource_type Type name of resource to search for.
    # @option options [String] :sort_by (updated_at:asc) A field to sort by. The **default** order is **ascending**. If you want to change the sort order to descending, append `:desc` to the field e.g. `sort_by=name:desc`.
    # @return [Array<Tag>] The list of Tags for the first page, unless otherwise specified. 
    def where(options = {})
      _, _, root = @client.get("/tags", options)

      root[:items].map{ |item| Tag.new(item[:data]) }
    end
    

    # Create a tag
    # 
    # post '/tags'
    #
    # Creates a new tag
    # **Notice** the tag's name **must** be unique within the scope of the resource_type
    #
    # @param tag [Tag, Hash] Either object of the Tag type or Hash. This object's attributes describe the object to be created. 
    # @return [Tag] The resulting object represting created resource. 
    def create(tag)
      validate_type!(tag)

      attributes = sanitize(tag)
      _, _, root = @client.post("/tags", attributes)

      Tag.new(root[:data])
    end
    

    # Retrieve a single tag
    # 
    # get '/tags/{id}'
    #
    # Returns a single tag available to the user according to the unique ID provided
    # If the specified tag does not exist, this query will return an error
    #
    # @param id [Integer] Unique identifier of a Tag
    # @return [Tag] Searched resource object. 
    def find(id)
      _, _, root = @client.get("/tags/#{id}")

      Tag.new(root[:data])
    end
    

    # Update a tag
    # 
    # put '/tags/{id}'
    #
    # Updates a tag's information
    # If the specified tag does not exist, this query will return an error
    # **Notice** if you want to update a tag, you **must** make sure the tag's name is unique within the scope of the specified resource
    #
    # @param tag [Tag, Hash] Either object of the Tag type or Hash. This object's attributes describe the object to be updated. 
    # @return [Tag] The resulting object represting updated resource. 
    def update(tag)
      validate_type!(tag)
      params = extract_params!(tag, :id)
      id = params[:id]

      attributes = sanitize(tag)
      _, _, root = @client.put("/tags/#{id}", attributes)

      Tag.new(root[:data])
    end
    

    # Delete a tag
    # 
    # delete '/tags/{id}'
    #
    # Deletes an existing tag
    # If the specified tag is assigned to any resource, we will remove this tag from all such resources
    # If the specified tag does not exist, this query will return an error
    # This operation cannot be undone
    #
    # @param id [Integer] Unique identifier of a Tag
    # @return [Boolean] Status of the operation.
    def destroy(id)
      status, _, _ = @client.delete("/tags/#{id}")
      status == 204
    end
    

  private
    def validate_type!(tag)
      raise TypeError unless tag.is_a?(Tag) || tag.is_a?(Hash)
    end

    def extract_params!(tag, *args)
      params = tag.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end
       
    def sanitize(tag)
      tag.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
    end
  end
end
