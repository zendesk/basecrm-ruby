require 'spec_helper'

describe BaseCRM::DealsService do
  describe 'Responds to' do
    subject { client.deals  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :upsert }
    it { should respond_to :where }

  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.deals.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.deals.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of Deal class" do
      deal = build(:deal)
      expect(client.deals.create(deal)).to be_instance_of BaseCRM::Deal
    end

    it "allows to create a Deal with hash of parameters" do
      deal = attributes_for(:deal)
      expect(client.deals.create(deal)).to be_instance_of BaseCRM::Deal
    end
  end

  describe :find do
    before :each do
      @deal = create(:deal)
    end

    it "returns an instance of Deal class" do
      expect(client.deals.find(@deal.id)).to be_instance_of BaseCRM::Deal
    end
  end

  describe :update do
    it "returns an updated instance of Deal class" do
      @deal = create(:deal)
      expect(client.deals.update(@deal)).to be_instance_of BaseCRM::Deal
    end

    it "allows to skip deal value in payload" do
      @deal = create(:deal, value: nil)
      expect(client.deals.update(@deal)).to be_instance_of BaseCRM::Deal
    end
  end

  describe :upsert do
    it 'raises a TypeError if filters is nil' do
      expect(client.deals.upsert(nil, { name: 'unique_name' }).to raise_error(TypeError)
    end

    it 'raises an ArgumentError if filters is empty' do
      expect(client.deals.upsert({}, { name: 'unique_name' }).to raise_error(ArgumentError)
    end

    it 'calls the upsert route with encoded filters' do
      filters = { name: 'unique_name', 'custom_fields[external_id]': 'unique-1' }
      attributes = filters.merge('custom_fields[category]': 'bags')
      expect(client.deals.upsert(filters, attributes)).to be_instance_of BaseCRM::Deal
    end
  end
 
  describe :destroy do
    it "returns true on success" do
      @deal = create(:deal)
      expect(client.deals.destroy(@deal.id)).to be_truthy
    end
  end
end
