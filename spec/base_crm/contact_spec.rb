require "spec_helper"

describe BaseCrm::Contact do

  subject do
    BaseCrm::Contact.new({ :id => 1234 })
  end

  it_behaves_like "noteable", "Contact"
  it_behaves_like "taskable", "Contact"

  describe "endpoint" do
    let(:production_endpoint_url) { "https://crm.futuresimple.com" }

    it_behaves_like "uses production"
  end

  describe "simplify_custom_fields" do

    it "converts a hash into the value" do
      subject.custom_fields = {
        'test' => { 'value' => 'yes!' }
      }
      result = subject.simplify_custom_fields

      expect(result).to eq({ 'test' => 'yes!' })
    end
  end

  describe "#payload" do
    it "removes wrong fields from payload" do
      subject.tags_joined_by_comma = 'ARRG'
      subject.linkedin_display = 'THIS IS SO WRONG'
      hash = subject.payload

      expect(hash).to_not have_key('tags_joined_by_comma')
      expect(hash).to_not have_key('linkedin_display')
    end

    it "uses tags_joined_by_comma to update tags" do
      subject.tags_joined_by_comma = "abc, dce"

      expect(subject.payload["tag_list"]).to eq("abc, dce")
    end

    it "uses tag_list to update tags if provided (backwards compatibility)" do
      subject.tags_joined_by_comma = "abc, dce"
      subject.tag_list = "bob, joe"

      expect(subject.payload["tag_list"]).to eq("bob, joe")
    end
  end

  describe ".fetch_for_deal" do
    let(:scope) { double }
    let(:deal) { double(:id => 444) }

    it "returns the scope" do
      expect(BaseCrm::Contact).to receive(:scope).and_return(scope)

      expect(scope).to receive(:endpoint)
        .with(BaseCrm.config.endpoints.sales)
        .and_return(scope)

      expect(scope).to receive(:path)
        .with("/api/v1/deals/#{deal.id}/contacts")
        .and_return(scope)

      expect(BaseCrm::Contact.fetch_for_deal(deal)).to eq(scope)
    end
  end

  describe "#notes" do
    let(:scope) { double }
    let(:fetch_scope) { double }

    it "passes the token and applies the params" do
      expect(subject).to receive(:pass_headers)
        .with(BaseCrm::Note)
        .and_return(scope)

      expect(scope).to receive(:params)
        .with({
          :noteable_type => "Contact",
          :noteable_id => subject.id
        }).and_return(fetch_scope)

      expect(subject.notes).to eq(fetch_scope)
    end

  end

end

