module BaseCrm
  class Deal < ApiClient::Resource::Base

    namespace "deal"

    prefix    "api/v1"

    always do
      endpoint BaseCrm.config.endpoints.sales
    end

    def source
      Source.find(self.source_id)
    rescue ApiClient::Errors::NotFound
    end

  end
end

