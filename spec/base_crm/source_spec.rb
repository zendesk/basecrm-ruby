require "spec_helper"

describe BaseCrm::Source do

  subject do
    BaseCrm::Source.new({})
  end

  describe "endpoint" do
    let(:production_endpoint_url) { "https://sales.futuresimple.com" }

    it_behaves_like "uses production"
  end

end

