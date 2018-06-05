require 'spec_helper'

describe BaseCRM::DealUnqualifiedReasonsService do
  describe 'Responds to' do
    subject { client.deal_unqualified_reasons  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.deal_unqualified_reasons.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.deal_unqualified_reasons.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of DealUnqualifiedReason class" do
      @deal_unqualified_reason = build(:deal_unqualified_reason)
      expect(client.deal_unqualified_reasons.create(@deal_unqualified_reason)).to be_instance_of BaseCRM::DealUnqualifiedReason
    end
  end

  describe :find do
    before :each do
      @deal_unqualified_reason = create(:deal_unqualified_reason)
    end

    it "returns an instance of DealUnqualifiedReason class" do
      expect(client.deal_unqualified_reasons.find(@deal_unqualified_reason.id)).to be_instance_of BaseCRM::DealUnqualifiedReason
    end
  end

  describe :update do
    it "returns an updated instance of DealUnqualifiedReason class" do
      @deal_unqualified_reason = create(:deal_unqualified_reason)
      expect(client.deal_unqualified_reasons.update(@deal_unqualified_reason)).to be_instance_of BaseCRM::DealUnqualifiedReason
    end
  end

  describe :destroy do
    it "returns true on success" do
      @deal_unqualified_reason = create(:deal_unqualified_reason)
      expect(client.deal_unqualified_reasons.destroy(@deal_unqualified_reason.id)).to be_truthy
    end
  end
end
