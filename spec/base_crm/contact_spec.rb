require "spec_helper"

describe BaseCrm::Contact do

  subject do
    BaseCrm::Contact.new({ :id => 1234 })
  end

  it_behaves_like "noteable", "Contact"
  it_behaves_like "taskable", "Contact"

  describe "endpoint" do

    it "uses the production endpoint" do
      BaseCrm::Contact.scope.instance_eval do
        @endpoint.should == "https://crm.futuresimple.com"
      end
    end

  end

  describe "simplify_custom_fields" do

    it "converts a hash into the value" do
      subject.custom_fields = {
        'test' => { 'value' => 'yes!' }
      }
      result = subject.simplify_custom_fields
      result.should == { 'test' => 'yes!' }
    end
  end

  describe "#payload" do

    it "removes wrong fields from payload" do
      subject.tags_joined_by_comma = 'ARRG'
      subject.linkedin_display = 'THIS IS SO WRONG'
      hash = subject.payload
      hash.has_key?('tags_joined_by_comma').should be_false
      hash.has_key?('linkedin_display').should be_false
    end
  end

  describe ".fetch_for_deal" do
    let(:scope) { mock }
    let(:deal) { mock(:id => 444) }

    it "returns the scope" do
      BaseCrm::Contact.should_receive(:scope).and_return(scope)
      scope.should_receive(:endpoint).
        with(BaseCrm.config.endpoints.sales).
        and_return(scope)
      scope.should_receive(:path).
        with("/api/v1/deals/#{deal.id}/contacts").
        and_return(scope)
      BaseCrm::Contact.fetch_for_deal(deal).should == scope
    end

  end

  describe "#notes" do
    let(:scope) { mock }
    let(:fetch_scope) { mock }

    it "passes the token and applies the params" do
      subject.
        should_receive(:pass_headers).
        with(BaseCrm::Note).
        and_return(scope)
      scope.should_receive(:params).
        with({
          :noteable_type => "Contact",
          :noteable_id => subject.id
        }).and_return(fetch_scope)
      subject.notes.should == fetch_scope
    end

  end

end

