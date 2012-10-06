require "spec_helper"

describe BaseCrm::Account do

  subject do
    BaseCrm::Account.new({})
  end

  describe "endpoint" do

    it "uses the production endpoint" do
      BaseCrm::Account.scope.instance_eval do
        @endpoint.should == "https://sales.futuresimple.com"
      end
    end

  end

end

