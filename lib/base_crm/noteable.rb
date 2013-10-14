module BaseCrm
  module Noteable

    def notes
      @notes ||= BaseCrm::RelatedObjectScope.new(self, Note, :noteable)
    end

    # Keeping it for legacy purposes
    def create_note(message)
      notes.create(:content => message)
    end

  end
end

