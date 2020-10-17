require 'spec_helper'

describe BaseCRM::CustomFieldsService do
  describe 'Responds to' do
    subject { client.custom_fields  }

    it { should respond_to :all }
  end

  describe :all do
    it "returns an array" do
      expect(client.custom_fields.all('contact')).to be_instance_of(Array)
    end

    it 'raises IncorrectResourceType if resource type not approved' do
      expect do
        client.custom_fields.all('not_valid')
      end.to raise_exception(BaseCRM::CustomFieldsService::IncorrectResourceType)
    end
  end
end
