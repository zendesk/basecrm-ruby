module BaseCrm
  class Deal < ApiClient::Resource::Base

    namespace "deal"

    prefix    "api/v1"

    always do
      endpoint "https://sales.futuresimple.com"
    end

  end
end

