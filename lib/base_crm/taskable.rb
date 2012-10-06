module BaseCrm
  module Taskable

    def tasks
      pass_headers(Task).params({
        :noteable_type => self.taskable_type,
        :noteable_id => self.id
      })
    end

    def create_task(params)
      pass_headers(Task).create({
        :noteable_type => self.taskable_type,
        :noteable_id => self.id
      }.merge(params))
    end

  end
end

