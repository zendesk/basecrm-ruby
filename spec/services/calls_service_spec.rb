require 'spec_helper'

describe BaseCRM::CallsService do
  describe 'Responds to' do
    subject { client.calls  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.calls.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.calls.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of Call class" do
      @call = build(:call)
      expect(client.calls.create(@call)).to be_instance_of BaseCRM::Call
    end
  end

  describe :find do
    before :each do
      @call = create(:call)
    end

    it "returns an instance of Call class" do
      expect(client.calls.find(@call.id)).to be_instance_of BaseCRM::Call
    end
  end

  describe :update do
    it "returns an updated instance of Call class" do
      @call = create(:call)
      contact = create(:contact)

      expect(client.calls.update(id: @call.id, resource_type: "contact", resource_id: contact.id)).to be_instance_of BaseCRM::Call
    end
  end

  describe :destroy do
    it "returns true on success" do
      @call = create(:call)
      expect(client.calls.destroy(@call.id)).to be_truthy
    end
  end
end
