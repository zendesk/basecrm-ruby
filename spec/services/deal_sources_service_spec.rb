require 'spec_helper'

describe BaseCRM::DealSourcesService do
  describe 'Responds to' do
    subject { client.deal_sources  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }
 
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.deal_sources.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.deal_sources.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of DealSource class" do
      @deal_source = build(:deal_source)
      expect(client.deal_sources.create(@deal_source)).to be_instance_of BaseCRM::DealSource
    end
  end

  describe :find do
    before :each do
      @deal_source = create(:deal_source) 
    end

    it "returns an instance of DealSource class" do
      expect(client.deal_sources.find(@deal_source.id)).to be_instance_of BaseCRM::DealSource
    end
  end

  describe :update do
    it "returns an updated instance of DealSource class" do
      @deal_source = create(:deal_source)
      expect(client.deal_sources.update(@deal_source)).to be_instance_of BaseCRM::DealSource
    end
  end

  describe :destroy do
    it "returns true on success" do
      @deal_source = create(:deal_source)
      expect(client.deal_sources.destroy(@deal_source.id)).to be_truthy
    end
  end
end
