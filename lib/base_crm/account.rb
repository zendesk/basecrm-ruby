module BaseCrm
  class Account < ApiClient::Resource::Base

    prefix    "api/v1"

    always do
      endpoint "https://sales.futuresimple.com"
    end


  end
end
