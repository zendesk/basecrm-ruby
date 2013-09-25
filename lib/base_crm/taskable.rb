module BaseCrm
  module Taskable

    def tasks
      @tasks ||= BaseCrm::RelatedObjectScope.new(self, Task, :taskable)
    end

    # Keeping it for legacy purposes
    def create_task(params)
      tasks.create(params)
    end

  end
end

