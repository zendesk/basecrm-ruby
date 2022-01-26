require 'spec_helper'

describe BaseCRM::ContactsService do
  describe 'Responds to' do
    subject { client.contacts  }

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
      expect(client.contacts.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.contacts.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of Contact class" do
      @contact = build(:contact)
      expect(client.contacts.create(@contact)).to be_instance_of BaseCRM::Contact
    end
  end

  describe :find do
    before :each do
      @contact = create(:contact)
    end

    it "returns an instance of Contact class" do
      expect(client.contacts.find(@contact.id)).to be_instance_of BaseCRM::Contact
    end
  end

  describe :update do
    it "returns an updated instance of Contact class" do
      @contact = create(:contact)
      expect(client.contacts.update(@contact)).to be_instance_of BaseCRM::Contact
    end
  end

  describe :upsert do
    it 'raises a TypeError if filters is nil' do
      expect(client.contacts.upsert(nil, { name: 'unique_name' }).to raise_error(TypeError)
    end

    it 'raises an ArgumentError if filters is empty' do
      expect(client.contacts.upsert({}, { name: 'unique_name' }).to raise_error(ArgumentError)
    end

    it 'calls the upsert route with encoded filters' do
      filters = { name: 'unique_name', 'custom_fields[external_id]': 'unique-1' }
      contact = create(:contact)
      expect(client.contacts.upsert(filters, contact)).to be_instance_of BaseCRM::Contact
    end
  end

  describe :destroy do
    it "returns true on success" do
      @contact = create(:contact)
      expect(client.contacts.destroy(@contact.id)).to be_truthy
    end
  end
end
