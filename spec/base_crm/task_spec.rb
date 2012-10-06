require "spec_helper"

describe BaseCrm::Task do

  subject do
    BaseCrm::Task.new({})
  end

  describe "endpoint" do

    it "uses the production endpoint" do
      BaseCrm::Task.scope.instance_eval do
        @endpoint.should == "https://common.futuresimple.com"
      end
    end

  end

end


