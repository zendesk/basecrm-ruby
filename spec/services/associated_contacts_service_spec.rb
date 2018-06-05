require 'spec_helper'

describe BaseCRM::AssociatedContactsService do
  describe 'Responds to' do
    subject { client.associated_contacts  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :where }
  end

  describe :all do
    it "returns a PaginatedResource" do
      deal_id = create(:deal).id
      expect(client.associated_contacts.all(deal_id)).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      deal_id = create(:deal).id
      expect(client.associated_contacts.where(deal_id, page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of AssociatedContact class" do
      deal_id = create(:deal).id
      @associated_contact = build(:associated_contact)
      expect(client.associated_contacts.create(deal_id, @associated_contact)).to be_instance_of BaseCRM::AssociatedContact
    end
  end

  describe :destroy do
    it "returns true on success" do
      deal_id = create(:deal).id
      @associated_contact = create(:associated_contact, deal_id: deal_id)
      expect(client.associated_contacts.destroy(deal_id, @associated_contact.contact_id)).to be_truthy
    end
  end
end
