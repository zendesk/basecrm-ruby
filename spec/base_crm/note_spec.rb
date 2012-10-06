require "spec_helper"

describe BaseCrm::Note do

  subject do
    BaseCrm::Note.new({})
  end

  describe "endpoint" do

    it "uses the production endpoint" do
      BaseCrm::Note.scope.instance_eval do
        @endpoint.should == "https://common.futuresimple.com"
      end
    end

  end

end

