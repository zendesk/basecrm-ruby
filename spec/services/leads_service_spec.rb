require 'spec_helper'

describe BaseCRM::LeadsService do
  describe 'Responds to' do
    subject { client.leads  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }
 
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.leads.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.leads.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of Lead class" do
      @lead = build(:lead)
      expect(client.leads.create(@lead)).to be_instance_of BaseCRM::Lead
    end
  end

  describe :find do
    before :each do
      @lead = create(:lead) 
    end

    it "returns an instance of Lead class" do
      expect(client.leads.find(@lead.id)).to be_instance_of BaseCRM::Lead
    end
  end

  describe :update do
    it "returns an updated instance of Lead class" do
      @lead = create(:lead)
      expect(client.leads.update(@lead)).to be_instance_of BaseCRM::Lead
    end
  end

  describe :destroy do
    it "returns true on success" do
      @lead = create(:lead)
      expect(client.leads.destroy(@lead.id)).to be_truthy
    end
  end
end
