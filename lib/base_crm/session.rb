module BaseCrm
  class Session

    attr_accessor :token

    def initialize(token)
      @token = token
    end

    def account
      pass_headers(BaseCrm::Account).
        fetch('/api/v1/account.json')
    end

    def contacts
      pass_headers BaseCrm::Contact
    end

    def deals
      pass_headers BaseCrm::Deal
    end

    def sources
      pass_headers BaseCrm::Source
    end

    def notes
      pass_headers BaseCrm::Note
    end

    def tasks
      pass_headers BaseCrm::Task
    end

    def leads
      pass_headers BaseCrm::Lead
    end

    private

    def pass_headers(klass)
      klass.
        headers("X-Pipejump-Auth" => self.token).
        headers("X-Futuresimple-Token" => self.token)
    end

  end
end
