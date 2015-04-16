require 'spec_helper'

describe BaseCRM::UsersService do
  describe 'Responds to' do
    subject { client.users  }

    it { should respond_to :all }
    it { should respond_to :find }
    it { should respond_to :self }
    it { should respond_to :where }
 
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.users.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.users.where(page: 1)).to be_an Array
    end
  end

  describe :find do
 
    it "returns an instance of User class" do
      user = client.users.self
      expect(client.users.find(user.id)).to be_instance_of BaseCRM::User
    end
  end

  describe :self do
    it "returns instance of User class" do
      expect(client.users.self).to be_instance_of BaseCRM::User 
    end
  end
end
