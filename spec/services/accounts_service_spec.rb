require 'spec_helper'

describe BaseCRM::AccountsService do
  describe 'Responds to' do
    subject { client.accounts  }

    it { should respond_to :self }
  end

  describe :self do
    it "returns instance of Account class" do
      expect(client.accounts.self).to be_instance_of BaseCRM::Account
    end
  end
end
