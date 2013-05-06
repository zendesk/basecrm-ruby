module BaseCrm
  class Deal < ApiClient::Resource::Base

    include BaseCrm::Resource
    include BaseCrm::Noteable
    include BaseCrm::Taskable

    namespace false

    prefix "api/v1"

    always do
      endpoint BaseCrm.config.endpoints.sales
    end

    def source
      if self.source_id
        pass_headers(Source).find(self.source_id)
      end
    rescue ApiClient::Errors::NotFound
    end

    def contact
      pass_headers(Contact).find(self.entity_id)
    rescue ApiClient::Errors::NotFound
    end

    def contacts
      pass_headers(Contact).fetch_for_deal(self)
    end

    def forecasting
      pass_headers(Forecasting).fetch_for_deal(self)
    end

    def noteable_type
      "Deal"
    end

    def taskable_type
      "Deal"
    end

    def self.build_one(result)
      super result['deal']
    end

  end
end

