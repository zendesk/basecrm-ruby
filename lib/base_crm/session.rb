module BaseCrm
  class Session

    attr_accessor :token

    def initialize(token)
      @token = token
    end

    def contacts
      BaseCrm::Contact.headers("X-Pipejump-Auth" => self.token)
    end

  end
end
