require 'spec_helper'

describe BaseCRM::DealsService do
  describe 'Responds to' do
    subject { client.deals  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }

  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.deals.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.deals.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of Deal class" do
      @deal = build(:deal)
      expect(client.deals.create(@deal)).to be_instance_of BaseCRM::Deal
    end

    it "allows for creation with integer deal value" do
      @deal_with_zero_precision = build(:deal)
      expect(client.deals.create(@deal_with_zero_precision)).to be_instance_of BaseCRM::Deal
    end

  end

  describe :find do
    before :each do
      @deal = create(:deal)
    end

    it "returns an instance of Deal class" do
      expect(client.deals.find(@deal.id)).to be_instance_of BaseCRM::Deal
    end
  end

  describe :update do
    it "returns an updated instance of Deal class" do
      @deal = create(:deal)
      expect(client.deals.update(@deal)).to be_instance_of BaseCRM::Deal
    end
  end

  describe :destroy do
    it "returns true on success" do
      @deal = create(:deal)
      expect(client.deals.destroy(@deal.id)).to be_truthy
    end
  end

  context "deal value" do
    before do
      @deal = create(:deal)
      @deal_with_zero_precision = create(:deal_with_zero_precision)
    end

    it "returns integer when deal has no decimal part" do
      expect(client.deals.find(@deal_with_zero_precision.id).value).to eq(1000)
    end

    it "returns float when deal has  decimal part" do
      expect(client.deals.find(@deal.id).value).to eq(1000.1)
    end
  end
end
