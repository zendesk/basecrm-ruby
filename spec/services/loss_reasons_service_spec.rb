require 'spec_helper'

describe BaseCRM::LossReasonsService do
  describe 'Responds to' do
    subject { client.loss_reasons  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }
 
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.loss_reasons.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.loss_reasons.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of LossReason class" do
      @loss_reason = build(:loss_reason)
      expect(client.loss_reasons.create(@loss_reason)).to be_instance_of BaseCRM::LossReason
    end
  end

  describe :find do
    before :each do
      @loss_reason = create(:loss_reason) 
    end

    it "returns an instance of LossReason class" do
      expect(client.loss_reasons.find(@loss_reason.id)).to be_instance_of BaseCRM::LossReason
    end
  end

  describe :update do
    it "returns an updated instance of LossReason class" do
      @loss_reason = create(:loss_reason)
      expect(client.loss_reasons.update(@loss_reason)).to be_instance_of BaseCRM::LossReason
    end
  end

  describe :destroy do
    it "returns true on success" do
      @loss_reason = create(:loss_reason)
      expect(client.loss_reasons.destroy(@loss_reason.id)).to be_truthy
    end
  end
end
