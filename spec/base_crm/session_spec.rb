require "spec_helper"

describe BaseCrm::Session do

  let(:token) { "OMGTOKEN" }

  subject do
    BaseCrm::Session.new(token)
  end

  describe "#contacts" do

    it "queries the contacts with the right header" do

      BaseCrm::Contact.should_receive(:headers).with({
        "X-Pipejump-Auth" => token
      })
      subject.contacts
    end
  end

  describe "#account" do

    it "gets the account" do

      BaseCrm::Account.should_receive(:headers).with({
        "X-Pipejump-Auth" => token
      }).and_return(BaseCrm::Account)
      BaseCrm::Account.should_receive(:fetch).with('/api/v1/account.json')
      subject.account
    end
  end

end

