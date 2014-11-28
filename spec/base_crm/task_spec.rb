require "spec_helper"

describe BaseCrm::Task do

  subject do
    BaseCrm::Task.new({})
  end

  describe "endpoint" do
    let(:production_endpoint_url) { "https://common.futuresimple.com" }

    it_behaves_like "uses production"
  end

end


