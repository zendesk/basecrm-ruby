require 'spec_helper'

describe BaseCRM::TagsService do
  describe 'Responds to' do
    subject { client.tags  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.tags.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.tags.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of Tag class" do
      @tag = build(:tag)
      expect(client.tags.create(@tag)).to be_instance_of BaseCRM::Tag
    end
  end

  describe :find do
    before :each do
      @tag = create(:tag)
    end

    it "returns an instance of Tag class" do
      expect(client.tags.find(@tag.id)).to be_instance_of BaseCRM::Tag
    end
  end

  describe :update do
    it "returns an updated instance of Tag class" do
      @tag = create(:tag)
      expect(client.tags.update(@tag)).to be_instance_of BaseCRM::Tag
    end
  end

  describe :destroy do
    it "returns true on success" do
      @tag = create(:tag)
      expect(client.tags.destroy(@tag.id)).to be_truthy
    end
  end
end
