require 'spec_helper'

describe BaseCRM::LeadSourcesService do
  describe 'Responds to' do
    subject { client.lead_sources  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.lead_sources.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.lead_sources.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of LeadSource class" do
      @lead_source = build(:lead_source)
      expect(client.lead_sources.create(@lead_source)).to be_instance_of BaseCRM::LeadSource
    end
  end

  describe :find do
    before :each do
      @lead_source = create(:lead_source)
    end

    it "returns an instance of LeadSource class" do
      expect(client.lead_sources.find(@lead_source.id)).to be_instance_of BaseCRM::LeadSource
    end
  end

  describe :update do
    it "returns an updated instance of LeadSource class" do
      @lead_source = create(:lead_source)
      expect(client.lead_sources.update(@lead_source)).to be_instance_of BaseCRM::LeadSource
    end
  end

  describe :destroy do
    it "returns true on success" do
      @lead_source = create(:lead_source)
      expect(client.lead_sources.destroy(@lead_source.id)).to be_truthy
    end
  end
end
