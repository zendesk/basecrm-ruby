# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class TasksService
    OPTS_KEYS_TO_PERSIST = Set[:completed, :content, :due_date, :owner_id, :remind_at, :resource_id, :resource_type]

    def initialize(client)
      @client = client
    end

    # Retrieve all tasks
    #
    # get '/tasks'
    #
    # If you want to use filtering or sorting (see #where).
    # @return [Enumerable] Paginated resource you can use to iterate over all the resources.
    def all
      PaginatedResource.new(self)
    end

    # Retrieve all tasks
    #
    # get '/tasks'
    #
    # Returns all tasks available to the user, according to the parameters provided
    # If you ask for tasks without any parameter provided Base API will return you both **floating** and **related** tasks
    # Although you can narrow the search set to either of them via query parameters
    #
    # @param options [Hash] Search options
    # @option options [Boolean] :completed Indicates whether the query will return tasks that are completed or not.
    # @option options [Integer] :creator_id Unique identifier of the user. Returns all tasks created by the user.
    # @option options [String] :ids Comma-separated list of task IDs to be returned in a request.
    # @option options [Boolean] :overdue Indicates whether the query will return tasks where the `due_date` parameter has been passed or not.
    # @option options [Integer] :owner_id Unique identifier of the user. Returns all tasks owned by the user.
    # @option options [Integer] :page (1) Page number to start from. Page numbering starts at 1 and omitting the `page` parameter will return the first page.
    # @option options [Integer] :per_page (25) Number of records to return per page. The default limit is *25* and the maximum number that can be returned is *100*.
    # @option options [String] :q A query string to search for. Performs a full text search on the `content` field.
    # @option options [Boolean] :remind Indicates whether the query will return tasks with reminders or without reminders.
    # @option options [Integer] :resource_id Unique identifier of the resource that you're searching for.
    # @option options [String] :resource_type Name of the resource type to search for.
    # @option options [String] :sort_by (updated_at:asc) A field to sort by. The **default** ordering is **ascending**. If you want to change the sort order to descending, append `:desc` to the field e.g. `sort_by=resource_type:desc`.
    # @option options [String] :type Type of tasks to search for.
    # @return [Array<Task>] The list of Tasks for the first page, unless otherwise specified.
    def where(options = {})
      _, _, root = @client.get("/tasks", options)

      root[:items].map{ |item| Task.new(item[:data]) }
    end


    # Create a task
    #
    # post '/tasks'
    #
    # Creates a new task
    # You can create either a **floating** task or create a **related** task and associate it with one of the resource types below:
    # * [Leads](/docs/rest/reference/leads)
    # * [Contacts](/docs/rest/reference/contacts)
    # * [Deals](/docs/rest/reference/deals)
    #
    # @param task [Task, Hash] Either object of the Task type or Hash. This object's attributes describe the object to be created.
    # @return [Task] The resulting object represting created resource.
    def create(task)
      validate_type!(task)

      attributes = sanitize(task)
      _, _, root = @client.post("/tasks", attributes)

      Task.new(root[:data])
    end


    # Retrieve a single task
    #
    # get '/tasks/{id}'
    #
    # Returns a single task available to the user according to the unique task ID provided
    # If the specified task does not exist, this query will return an error
    #
    # @param id [Integer] Unique identifier of a Task
    # @return [Task] Searched resource object.
    def find(id)
      _, _, root = @client.get("/tasks/#{id}")

      Task.new(root[:data])
    end


    # Update a task
    #
    # put '/tasks/{id}'
    #
    # Updates task information
    # If the specified task does not exist, this query will return an error
    #
    # @param task [Task, Hash] Either object of the Task type or Hash. This object's attributes describe the object to be updated.
    # @return [Task] The resulting object represting updated resource.
    def update(task)
      validate_type!(task)
      params = extract_params!(task, :id)
      id = params[:id]

      attributes = sanitize(task)
      _, _, root = @client.put("/tasks/#{id}", attributes)

      Task.new(root[:data])
    end


    # Delete a task
    #
    # delete '/tasks/{id}'
    #
    # Delete an existing task
    # If the specified task does not exist, this query will return an error
    # This operation cannot be undone
    #
    # @param id [Integer] Unique identifier of a Task
    # @return [Boolean] Status of the operation.
    def destroy(id)
      status, _, _ = @client.delete("/tasks/#{id}")
      status == 204
    end


  private
    def validate_type!(task)
      raise TypeError unless task.is_a?(Task) || task.is_a?(Hash)
    end

    def extract_params!(task, *args)
      params = task.to_h.select{ |k, _| args.include?(k) }
      raise ArgumentError, "one of required attributes is missing. Expected: #{args.join(',')}" if params.count != args.length
      params
    end

    def sanitize(task)
      task.to_h.select { |k, _| OPTS_KEYS_TO_PERSIST.include?(k) }
    end
  end
end
