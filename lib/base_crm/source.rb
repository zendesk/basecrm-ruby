module BaseCrm
  class Source < ApiClient::Resource::Base

    namespace "source"

    prefix    "api/v1"

    always do
      endpoint BaseCrm.config.endpoints.sales
    end

  end
end

