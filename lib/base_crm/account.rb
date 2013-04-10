module BaseCrm
  class Account < ApiClient::Resource::Base

    prefix    "api/v1"

    always do
      endpoint BaseCrm.config.endpoints.sales
    end

  end
end
