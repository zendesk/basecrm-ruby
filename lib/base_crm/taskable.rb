module BaseCrm
  module Taskable

    def tasks
      pass_headers(Task).params({
        :taskable_type => self.taskable_type,
        :taskable_id => self.id
      })
    end

    def create_task(params)
      pass_headers(Task).create({
        :taskable_type => self.taskable_type,
        :taskable_id => self.id
      }.merge(params))
    end

  end
end

