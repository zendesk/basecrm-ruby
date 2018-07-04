require 'spec_helper'

describe BaseCRM::CallOutcomesService do
  describe 'Responds to' do
    subject { client.call_outcomes  }

    it { should respond_to :all }
    it { should respond_to :where }
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.call_outcomes.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.call_outcomes.where(page: 1)).to be_an Array
    end
  end
end
