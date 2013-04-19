module BaseCrm
  class Forecasting < ApiClient::Resource::Base
    always do
      endpoint BaseCrm.config.endpoints.sales
    end

    def self.fetch_for_deal(deal)
      scope.get("/api/v1/deals/#{deal.id}/forecasting.json")
    end
  end
end

