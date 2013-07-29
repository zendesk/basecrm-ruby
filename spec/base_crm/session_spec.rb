require "spec_helper"

describe BaseCrm::Session do

  let(:token) { "OMGTOKEN" }

  subject do
    BaseCrm::Session.new(token)
  end

  describe "passing of headers" do
    let(:scope) { double }
    let(:scope_class) { double }

    before do
      scope_class.should_receive(:headers).with({
        "X-Pipejump-Auth" => token
      }).and_return(scope)
      scope.should_receive(:headers).with({
        "X-Futuresimple-Token" => token
      })
    end

    describe "#contacts" do
      let(:scope_class) { BaseCrm::Contact }

      it "queries the contacts with the right header" do
        subject.contacts
      end

    end

    describe "#deals" do
      let(:scope_class) { BaseCrm::Deal }

      it "queries the deals with the right header" do
        subject.deals
      end

    end

    describe "#sources" do
      let(:scope_class) { BaseCrm::Source }

      it "queries the sources with the right header" do
        subject.sources
      end

    end

    describe "#notes" do
      let(:scope_class) { BaseCrm::Note }

      it "queries the notes with the right header" do
        subject.notes
      end

    end

    describe "#tasks" do
      let(:scope_class) { BaseCrm::Task }

      it "queries the tasks with the right header" do
        subject.tasks
      end

    end

    describe "#leads" do
      let(:scope_class) { BaseCrm::Lead }

      it "queries the leads with the right header" do
        subject.leads
      end

    end


  end

  describe "#account" do

    it "gets the account" do
      BaseCrm::Account.should_receive(:headers).with({
        "X-Pipejump-Auth" => token
      }).and_return(BaseCrm::Account)
      BaseCrm::Account.should_receive(:headers).with({
        "X-Futuresimple-Token" => token
      }).and_return(BaseCrm::Account)
      BaseCrm::Account.should_receive(:fetch).with('/api/v1/account.json')
      subject.account
    end

  end

end

