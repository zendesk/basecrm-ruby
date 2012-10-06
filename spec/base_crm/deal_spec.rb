require "spec_helper"

describe BaseCrm::Deal do

  subject do
    BaseCrm::Deal.new({})
  end

  describe "endpoint" do

    it "uses the production endpoint" do
      BaseCrm::Deal.scope.instance_eval do
        @endpoint.should == "https://sales.futuresimple.com"
      end
    end

  end

  describe "#source" do

    let(:source) { mock }
    let(:source_id) { mock }

    before do
      subject.source_id = source_id
    end

    context "when it is found" do
      before do
        BaseCrm::Source.
          stub(:find).
          with(source_id).
          and_return(source)
      end
      it { subject.source.should == source }
    end

    context "when it is not found" do
      before do
        BaseCrm::Source.
          stub(:find).
          with(source_id).
          and_raise(ApiClient::Errors::NotFound)
      end
      it { subject.source.should == nil }
    end

  end

  describe "#contact" do

    let(:contact) { mock }
    let(:entity_id) { mock }

    before do
      subject.entity_id = entity_id
    end

    context "when it is found" do
      before do
        BaseCrm::Contact.
          stub(:find).
          with(entity_id).
          and_return(contact)
      end
      it { subject.contact.should == contact }
    end

    context "when it is not found" do
      before do
        BaseCrm::Contact.
          stub(:find).
          with(entity_id).
          and_raise(ApiClient::Errors::NotFound)
      end
      it { subject.contact.should == nil }
    end

  end

  describe "#contacts" do
    let(:scope) { mock }
    let(:fetch_scope) { mock }

    it "passes the token and users fetch_for_deal" do
      subject.should_receive(:pass_headers).with(BaseCrm::Contact).and_return(scope)
      scope.should_receive(:fetch_for_deal).with(subject).and_return(fetch_scope)
      subject.contacts.should == fetch_scope
    end

  end

end

