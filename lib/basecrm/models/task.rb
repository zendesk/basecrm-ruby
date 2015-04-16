# WARNING: This code is auto-generated from the BaseCRM API Discovery JSON Schema

module BaseCRM
  class Task < Model
    # @!attribute [r] completed_at
    #   @return [DateTime] Date and time of the task's completion in UTC (ISO8601 format).
    # attr_reader :completed_at
    # @!attribute [r] created_at
    #   @return [DateTime] Date and time of task creation in UTC (ISO8601 format).
    # attr_reader :created_at
    # @!attribute [r] creator_id
    #   @return [Integer] Unique identifier of the user who created the task.
    # attr_reader :creator_id
    # @!attribute [r] id
    #   @return [Integer] Unique identifier of the task.
    # attr_reader :id
    # @!attribute [r] overdue
    #   @return [Boolean] Indicator for whether the task has passed the `due_date` or not.
    # attr_reader :overdue
    # @!attribute [r] updated_at
    #   @return [DateTime] Date and time of the last update to the task in UTC (ISO8601 format).
    # attr_reader :updated_at

    # @!attribute [rw] completed
    #   @return [Boolean] Indicator of whether the task is completed or not.
    # attr_accessor :completed
    # @!attribute [rw] content
    #   @return [String] Content of the task.
    # attr_accessor :content
    # @!attribute [rw] due_date
    #   @return [DateTime] Date and time of creation in UTC (ISO8601 format).
    # attr_accessor :due_date
    # @!attribute [rw] owner_id
    #   @return [Integer] Unique identifier of the user the task is assigned to.
    # attr_accessor :owner_id
    # @!attribute [rw] remind_at
    #   @return [DateTime] Date and time that we should send you a reminder in UTC (ISO8601 format).
    # attr_accessor :remind_at
    # @!attribute [rw] resource_id
    #   @return [Integer] Unique identifier of the resource the task is attached to.
    # attr_accessor :resource_id
    # @!attribute [rw] resource_type
    #   @return [String] Name of the resource type the task is attached to.
    # attr_accessor :resource_type
  end
end
