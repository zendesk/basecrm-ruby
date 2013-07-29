require "spec_helper"

describe BaseCrm::Forecasting do

  subject do
    BaseCrm::Forecasting.new({})
  end

  describe "endpoint" do

    it "uses the production endpoint" do
      BaseCrm::Forecasting.scope.instance_eval do
        @endpoint.should == "https://sales.futuresimple.com"
      end
    end

  end

  describe ".fetch_for_deal" do
    let(:scope) { double }
    let(:deal) { double(:id => 444) }
    let(:result) { double }

    it "returns the scope" do
      BaseCrm::Forecasting.should_receive(:scope).and_return(scope)
      scope.should_receive(:get).
        with("/api/v1/deals/#{deal.id}/forecasting.json").
        and_return(result)
      BaseCrm::Forecasting.fetch_for_deal(deal).should == result
    end
  end

end

