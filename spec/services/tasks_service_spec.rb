require 'spec_helper'

describe BaseCRM::TasksService do
  describe 'Responds to' do
    subject { client.tasks  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.tasks.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.tasks.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of Task class" do
      @task = build(:task)
      expect(client.tasks.create(@task)).to be_instance_of BaseCRM::Task
    end
  end

  describe :find do
    before :each do
      @task = create(:task)
    end

    it "returns an instance of Task class" do
      expect(client.tasks.find(@task.id)).to be_instance_of BaseCRM::Task
    end
  end

  describe :update do
    it "returns an updated instance of Task class" do
      @task = create(:task)
      expect(client.tasks.update(@task)).to be_instance_of BaseCRM::Task
    end
  end

  describe :destroy do
    it "returns true on success" do
      @task = create(:task)
      expect(client.tasks.destroy(@task.id)).to be_truthy
    end
  end
end
