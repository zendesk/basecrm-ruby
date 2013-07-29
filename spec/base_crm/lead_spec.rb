require "spec_helper"

describe BaseCrm::Lead do

  subject do
    BaseCrm::Lead.new({ :id => 1234 })
  end

  it_behaves_like "noteable", "Lead"
  it_behaves_like "taskable", "Lead"

  describe "endpoint" do

    it "uses the production endpoint" do
      BaseCrm::Lead.scope.instance_eval do
        @endpoint.should == "https://leads.futuresimple.com"
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

  describe "response parsing" do
    let(:response) do
      {}
    end

    context "collection" do
      let(:items) { double }
      let(:response) do
        { "items" => items }
      end

      it "extracts the items" do
        BaseCrm::Lead.should_receive(:build_many).with(items)
        BaseCrm::Lead.build(response)
      end

    end

    context "single" do

      it "extracts the items" do
        BaseCrm::Lead.should_receive(:build_one).with(response)
        BaseCrm::Lead.build(response)
      end

    end

  end

end

