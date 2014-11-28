require "spec_helper"

describe BaseCrm::Lead do

  subject do
    BaseCrm::Lead.new({ :id => 1234 })
  end

  it_behaves_like "noteable", "Lead"
  it_behaves_like "taskable", "Lead"

  describe "endpoint" do
    let(:production_endpoint_url) { "https://leads.futuresimple.com" }

    it_behaves_like "uses production"
  end

  describe "simplify_custom_fields" do

    it "converts a hash into the value" do
      subject.custom_field_values = {
        'test' => { 'value' => 'yes!' }
      }
      result = subject.simplify_custom_fields

      expect(result).to eq({ 'test' => 'yes!' })
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
        expect(BaseCrm::Lead).to receive(:build_many).with(items)

        BaseCrm::Lead.build(response)
      end

    end

    context "single" do

      it "extracts the items" do
        expect(BaseCrm::Lead).to receive(:build_one).with(response)

        BaseCrm::Lead.build(response)
      end

    end

  end

end

