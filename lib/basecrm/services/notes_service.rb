# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class NotesService
    OPTS_KEYS_TO_PERSIST = Set[:content, :resource_id, :resource_type]

    def initialize(client)
      @client = client
    end

    # Retrieve all notes
    #
    # get '/notes'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all notes
    #
    # get '/notes'
    #
    # Returns all notes available to the user, according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [Integer] :creator_id Unique identifier of the user. Returns all notes created by the user.
    # @option options [String] :ids Comma-separated list of note IDs to be returned in a request.
    # @option options [String] :includes Comma-separated list of one or more resources related to the note. **Not supported at the moment**.
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. The default limit is *25* and the maximum number that can be returned at one time is *100*.
    # @option options [String] :q A query string to search for. Performs a full text search on the `content` field.
    # @option options [Integer] :resource_id Unique identifier of the resource to search for.
    # @option options [String] :resource_type Name of the type of resource to search for.
    # @option options [String] :sort_by (updated_at:asc) A field to sort by. **Default** ordering is **ascending**. If you want to change the sort ordering to descending, append `:desc` to the field e.g. `sort_by=resource_type:desc`.
    # @return [Array<Note>] The list of Notes for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/notes", options)

      root[:items].map{ |item| Note.new(item[:data]) }
    end


    # Create a note
    #
    # post '/notes'
    #
    # Create a new note and associate it with one of the resources listed below:
    # * [Leads](/docs/rest/reference/leads)
    # * [Contacts](/docs/rest/reference/contacts)
    # * [Deals](/docs/rest/reference/deals)
    #
    # @param note [Note, Hash] Either object of the Note type or Hash. This object's attributes describe the object to be created.
    # @return [Note] The resulting object represting created resource.
    def create(note)
      validate_type!(note)

      attributes = sanitize(note)
      _, _, root = @client.post("/notes", attributes)

      Note.new(root[:data])
    end


    # Retrieve a single note
    #
    # get '/notes/{id}'
    #
    # Returns a single note available to the user, according to the unique note ID provided
    # If the note ID does not exist, this request will return an error
    #
    # @param id [Integer] Unique identifier of a Note
    # @return [Note] Searched resource object.
    def find(id)
      _, _, root = @client.get("/notes/#{id}")

      Note.new(root[:data])
    end


    # Update a note
    #
    # put '/notes/{id}'
    #
    # Updates note information
    # If the note ID does not exist, this request will return an error
    #
    # @param note [Note, Hash] Either object of the Note type or Hash. This object's attributes describe the object to be updated.
    # @return [Note] The resulting object represting updated resource.
    def update(note)
      validate_type!(note)
      params = extract_params!(note, :id)
      id = params[:id]

      attributes = sanitize(note)
      _, _, root = @client.put("/notes/#{id}", attributes)

      Note.new(root[:data])
    end


    # Delete a note
    #
    # delete '/notes/{id}'
    #
    # Delete an existing note
    # If the note ID does not exist, this request will return an error
    # This operation cannot be undone
    #
    # @param id [Integer] Unique identifier of a Note
    # @return [Boolean] Status of the operation.
    def destroy(id)
      status, _, _ = @client.delete("/notes/#{id}")
      status == 204
    end


  private
    def validate_type!(note)
      raise TypeError unless note.is_a?(Note) || note.is_a?(Hash)
    end

    def extract_params!(note, *args)
      params = note.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end

    def sanitize(note)
      note.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
    end
  end
end
