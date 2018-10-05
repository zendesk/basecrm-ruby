require 'spec_helper'

describe BaseCRM::VisitOutcomesService do
  describe 'Responds to' do
    subject { client.visit_outcomes  }

    it { should respond_to :all }
    it { should respond_to :where }
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.visit_outcomes.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.visit_outcomes.where(page: 1)).to be_an Array
    end
  end
end
