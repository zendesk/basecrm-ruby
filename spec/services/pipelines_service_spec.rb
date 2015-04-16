require 'spec_helper'

describe BaseCRM::PipelinesService do
  describe 'Responds to' do
    subject { client.pipelines  }

    it { should respond_to :all }
    it { should respond_to :where }
 
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.pipelines.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.pipelines.where(page: 1)).to be_an Array
    end
  end
end
