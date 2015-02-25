require "spec_helper"

describe BaseCrm::Deal do
  subject { deal }

  let(:deal) { BaseCrm::Deal.new({ :id => 334 }) }
  let(:deals_scope) { ApiClient::Resource::Scope.new(BaseCrm::Deal) }

  before do
    deal.original_scope = deals_scope
  end

  it_behaves_like "noteable", "Deal"
  it_behaves_like "taskable", "Deal"

  describe "endpoint" do
    let(:production_endpoint_url) { "https://sales.futuresimple.com" }

    it_behaves_like "uses production"
  end

  describe "namespace" do

    it "has no default namespace" do
      expect(described_class.namespace).to be_falsey
    end

    context "when instantiating" do
      let(:name) { "deal name" }

      it "uses a namespace" do
        result = BaseCrm::Deal.build_one 'name' => name
        expect(result.name).to be_nil

        result = BaseCrm::Deal.build_one 'deal' => { 'name' => name }
        expect(result.name).to eq(name)
      end

    end

  end

  describe "#source" do

    let(:source_id) { 444 }
    let(:scope) { double }

    before do
      subject.source_id = source_id

      allow(subject).to receive(:pass_headers)
        .with(BaseCrm::Source)
        .and_return(scope)

      allow(scope).to receive(:find)
        .with(source_id)
        .and_return(source)
    end

    context "when it is found" do
      let(:source) { double }

      its(:source) { should eq(source) }
    end

    context "when it is not found" do
      let(:source) { nil }

      its(:source) { should be_nil }
    end

    context "when there is no source_id" do
      let(:source_id) { nil }
      let(:source) { nil }

      its(:source) { should be_nil }

      it "does nothing" do
        expect(subject).to_not receive(:pass_headers)
      end
    end

  end

  describe "#contact" do

    let(:entity_id) { double }
    let(:scope) { double }

    before do
      subject.entity_id = entity_id

      allow(subject).to receive(:pass_headers)
        .with(BaseCrm::Contact)
        .and_return(scope)

      allow(scope).to receive(:find)
        .with(entity_id)
        .and_return(contact)
    end

    context "when it is found" do
      let(:contact) { double }

      its(:contact) { should eq(contact) }
    end

    context "when it is not found" do
      let(:contact) { nil }

      its(:contact) { should be_nil }
    end

  end

  context "headers" do
    let(:scope) { double }
    let(:fetch_scope) { double(:fetch_for_deal) }

    before do
      allow(subject).to receive(:pass_headers)
        .with(pass_headers)
        .and_return(scope)

      allow(scope).to receive(:fetch_for_deal)
        .with(subject)
        .and_return(fetch_scope)
    end

    describe "#contacts" do
      let(:pass_headers) { BaseCrm::Contact }

      its(:contacts) { should eq(fetch_scope) }
    end

    describe "#forecasting" do
      let(:pass_headers) { BaseCrm::Forecasting }

      its(:forecasting) { should eq(fetch_scope) }
    end

  end
end

