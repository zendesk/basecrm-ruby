# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class UsersService
    def initialize(client)
      @client = client
    end

    # Retrieve all users
    # 
    # get '/users'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources. 
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all users
    # 
    # get '/users'
    #
    # Returns all users, according to the parameters provided
    #
    # @param options [Hash] Search options
    # @option options [Boolean] :confirmed Indicator whether to return only confirmed user accounts or not.
    # @option options [String] :email Email of the user. This parameter is used in a strict sense.
    # @option options [String] :ids Comma-separated list of user IDs to be returned in a request.
    # @option options [String] :name Name of the user. This parameter is used in a strict sense.
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1, and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. The default limit is *25*, and the maximum number that can be returned is *100*.
    # @option options [String] :role Role of user to search for.
    # @option options [String] :sort_by (id:asc) A field to sort by. The **default** order is **ascending**. If you want to change the sort order to descending, append `:desc` to the field e.g. `sort_by=name:desc`.
    # @option options [String] :status Status of user accounts to search for.
    # @return [Array<User>] The list of Users for the first page, unless otherwise specified. 
    def where(options = {})
      _, _, root = @client.get("/users", options)

      root[:items].map{ |item| User.new(item[:data]) }
    end
    

    # Retrieve a single user
    # 
    # get '/users/{id}'
    #
    # Returns a single user according to the unique user ID provided
    # If the specified user does not exist, this query returns an error
    #
    # @param id [Integer] Unique identifier of a User
    # @return [User] Searched resource object. 
    def find(id)
      _, _, root = @client.get("/users/#{id}")

      User.new(root[:data])
    end
    
  
    # Retrieve an authenticating user
    # 
    # get '/users/self'
    #
    # Returns a single authenticating user, according to the authentication credentials provided
    #
    # @return [User] Resource object. 
    def self
      _, _, root = @client.get("/users/self")
      User.new(root[:data])
    end


  private
    def validate_type!(user)
      raise TypeError unless user.is_a?(User) || user.is_a?(Hash)
    end

    def extract_params!(user, *args)
      params = user.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end
  end
end
