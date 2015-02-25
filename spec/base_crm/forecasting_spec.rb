require "spec_helper"

describe BaseCrm::Forecasting do

  subject do
    BaseCrm::Forecasting.new({})
  end

  describe "endpoint" do
    let(:production_endpoint_url) { "https://sales.futuresimple.com" }

    it_behaves_like "uses production"
  end

  describe ".fetch_for_deal" do
    let(:scope) { double }
    let(:deal) { double(:id => 444) }
    let(:result) { double }

    it "returns the scope" do
      expect(BaseCrm::Forecasting).to receive(:scope).and_return(scope)

      expect(scope).to receive(:get)
        .with("/api/v1/deals/#{deal.id}/forecasting.json")
        .and_return(result)

      expect(BaseCrm::Forecasting.fetch_for_deal(deal)).to eq(result)
    end
  end

end

