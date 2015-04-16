require 'spec_helper'

describe BaseCRM::StagesService do
  describe 'Responds to' do
    subject { client.stages  }

    it { should respond_to :all }
    it { should respond_to :where }
 
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.stages.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.stages.where(page: 1)).to be_an Array
    end
  end
end
