require 'spec_helper'

describe BaseCRM::NotesService do
  describe 'Responds to' do
    subject { client.notes  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.notes.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.notes.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of Note class" do
      @note = build(:note)
      expect(client.notes.create(@note)).to be_instance_of BaseCRM::Note
    end
  end

  describe :find do
    before :each do
      @note = create(:note)
    end

    it "returns an instance of Note class" do
      expect(client.notes.find(@note.id)).to be_instance_of BaseCRM::Note
    end
  end

  describe :update do
    it "returns an updated instance of Note class" do
      @note = create(:note)
      expect(client.notes.update(@note)).to be_instance_of BaseCRM::Note
    end
  end

  describe :destroy do
    it "returns true on success" do
      @note = create(:note)
      expect(client.notes.destroy(@note.id)).to be_truthy
    end
  end
end
