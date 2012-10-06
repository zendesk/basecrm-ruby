require "spec_helper"

describe BaseCrm::Source do

  subject do
    BaseCrm::Source.new({})
  end

  describe "endpoint" do

    it "uses the production endpoint" do
      BaseCrm::Source.scope.instance_eval do
        @endpoint.should == "https://sales.futuresimple.com"
      end
    end

  end

end

