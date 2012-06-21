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
    
    private

    def pass_headers(klass)
      klass.headers("X-Pipejump-Auth" => self.token)
    end

  end
end
