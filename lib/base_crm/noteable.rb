module BaseCrm
  module Noteable

    def notes
      pass_headers(Note).params({
        :noteable_type => self.noteable_type,
        :noteable_id => self.id
      })
    end

    def create_note(message)
      pass_headers(Note).create({
        :content => message,
        :noteable_type => self.noteable_type,
        :noteable_id => self.id
      })
    end

  end
end

