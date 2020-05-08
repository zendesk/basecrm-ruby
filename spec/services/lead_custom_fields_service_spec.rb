require 'spec_helper'

describe BaseCRM::LeadCustomFieldsService do
  describe 'Responds to' do
    subject { client.lead_custom_fields  }

    it { should respond_to :all }
  end

  describe :all do
    it "returns an array" do
      expect(client.lead_custom_fields.all).to be_an Array
    end
  end
end

