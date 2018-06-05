require 'spec_helper'

describe BaseCRM::LeadUnqualifiedReasonsService do
  describe 'Responds to' do
    subject { client.lead_unqualified_reasons  }

    it { should respond_to :all }
    it { should respond_to :where }
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.lead_unqualified_reasons.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.lead_unqualified_reasons.where(page: 1)).to be_an Array
    end
  end
end
