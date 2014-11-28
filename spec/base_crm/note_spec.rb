require "spec_helper"

describe BaseCrm::Note do

  subject do
    BaseCrm::Note.new({})
  end

  describe "endpoint" do
    let(:production_endpoint_url) { "https://common.futuresimple.com" }

    it_behaves_like "uses production"
  end

end

