require 'spec_helper'

describe BaseCRM::SourcesService do
  describe 'Responds to' do
    subject { client.sources  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }

  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.sources.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.sources.where(page: 1)).to be_an Array
    end

    it "returns lead sources when resource_type is 'lead'" do
      expect(client.sources.where(page: 1, resource_type: 'lead').first[:resource_type]).to eq("lead")
    end

    it "returns deal sources when resource_type is 'deal'" do
      expect(client.sources.where(page: 1, resource_type: 'deal').first[:resource_type]).to eq("deal")
    end
  end

  describe :create do
    it "returns instance of Source class" do
      @source = build(:source)
      expect(client.sources.create(@source)).to be_instance_of BaseCRM::Source
    end

    it "returns new lead source when resource_type is 'lead'" do
      @source = build(:lead_source)
      expect(client.sources.create(@source, resource_type: 'lead').resource_type).to eq("lead")
    end

    it "returns new deal source when resource_type is 'deal'" do
      @source = build(:deal_source)
      expect(client.sources.create(@source, resource_type: 'deal').resource_type).to eq("deal")
    end
  end

  describe :find do
    before :each do
      @source = create(:source)
      @lead_source = create(:lead_source)
    end

    it "returns an instance of Source class" do
      expect(client.sources.find(@source.id)).to be_instance_of BaseCRM::Source
    end

    it "returns a lead source when resource_type is 'lead'" do
      expect(client.sources.find(@lead_source.id, resource_type: 'lead').resource_type).to eq 'lead'
    end

    it "returns a deal source when resource_type is 'deal'" do
      expect(client.sources.find(@source.id, resource_type: 'deal').resource_type).to eq 'deal'
    end
  end

  describe :update do
    before :each do
      @source = create(:source)
      @lead_source = create(:lead_source)
    end

    it "returns an updated instance of Source class" do
      expect(client.sources.update(@source)).to be_instance_of BaseCRM::Source
    end

    it "returns a lead source when resource_type is 'lead'" do
      expect(client.sources.update(@lead_source, resource_type: 'lead').resource_type).to eq 'lead'
    end

    it "returns a deal source when resource_type is 'deal'" do
      expect(client.sources.update(@source, resource_type: 'deal').resource_type).to eq 'deal'
    end
  end

  describe :destroy do
    before :each do
      @source = create(:source)
      @lead_source = create(:lead_source)
    end

    it "returns true on success" do
      expect(client.sources.destroy(@source.id)).to be_truthy
    end

    it "returns true when when resource_type is 'lead'" do
      expect(client.sources.destroy(@lead_source.id, resource_type: 'lead')).to be_truthy
    end

    it "returns true when resource_type is 'deal'" do
      expect(client.sources.destroy(@source.id, resource_type: 'deal')).to be_truthy
    end
  end
end
