require "spec_helper"

describe BaseCrm::Contact do

  subject do
    BaseCrm::Contact.new({})
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

end

