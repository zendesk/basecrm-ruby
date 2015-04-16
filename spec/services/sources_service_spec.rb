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
  end

  describe :create do
    it "returns instance of Source class" do
      @source = build(:source)
      expect(client.sources.create(@source)).to be_instance_of BaseCRM::Source
    end
  end

  describe :find do
    before :each do
      @source = create(:source) 
    end

    it "returns an instance of Source class" do
      expect(client.sources.find(@source.id)).to be_instance_of BaseCRM::Source
    end
  end

  describe :update do
    it "returns an updated instance of Source class" do
      @source = create(:source)
      expect(client.sources.update(@source)).to be_instance_of BaseCRM::Source
    end
  end

  describe :destroy do
    it "returns true on success" do
      @source = create(:source)
      expect(client.sources.destroy(@source.id)).to be_truthy
    end
  end
end
