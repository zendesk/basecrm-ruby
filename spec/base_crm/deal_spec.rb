require "spec_helper"

describe BaseCrm::Deal do

  subject do
    d = BaseCrm::Deal.new({ :id => 334 })
    d.original_scope = ApiClient::Resource::Scope.new(BaseCrm::Deal)
    d
  end

  it_behaves_like "noteable", "Deal"
  it_behaves_like "taskable", "Deal"

  describe "namespace" do

    it "has no default namespace" do
      BaseCrm::Deal.namespace.should be_false
    end

    context "when instantiating" do
      let(:name) { "deal name" }

      it "uses a namespace" do
        result = BaseCrm::Deal.build_one 'name' => name
        result.name.should be_nil
        result = BaseCrm::Deal.build_one 'deal' => { 'name' => name }
        result.name.should == name
      end

    end

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
    let(:source_id) { 444 }
    let(:scope) { mock }

    before do
      subject.source_id = source_id
    end

    context "when it is found" do
      before do
        subject.stub(:pass_headers).with(BaseCrm::Source).and_return(scope)
        scope.
          stub(:find).
          with(source_id).
          and_return(source)
      end
      it { subject.source.should == source }
    end

    context "when it is not found" do
      before do
        subject.stub(:pass_headers).with(BaseCrm::Source).and_return(scope)
        scope.
          stub(:find).
          with(source_id).
          and_raise(ApiClient::Errors::NotFound)
      end
      it { subject.source.should == nil }
    end

    context "when there is no source_id" do
      let(:source_id) { nil }

      it "does nothing" do
        subject.should_not_receive(:pass_headers)
        subject.source.should be_nil
      end

    end

  end

  describe "#contact" do

    let(:contact) { mock }
    let(:entity_id) { mock }
    let(:scope) { mock }

    before do
      subject.entity_id = entity_id
    end

    context "when it is found" do
      before do
        subject.stub(:pass_headers).with(BaseCrm::Contact).and_return(scope)
        scope.
          stub(:find).
          with(entity_id).
          and_return(contact)
      end
      it { subject.contact.should == contact }
    end

    context "when it is not found" do
      before do
        subject.stub(:pass_headers).with(BaseCrm::Contact).and_return(scope)
        scope.
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

  describe "#forecasting" do
    let(:scope) { mock }
    let(:fetch_scope) { mock }

    it "passes the token and uses fetch_for_deal" do
      subject.should_receive(:pass_headers).with(BaseCrm::Forecasting).and_return(scope)
      scope.should_receive(:fetch_for_deal).with(subject).and_return(fetch_scope)
      subject.forecasting.should == fetch_scope
    end
  end
end

