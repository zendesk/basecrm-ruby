require 'spec_helper'

describe BaseCRM::OrdersService do
  describe 'Responds to' do
    subject { client.orders  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.orders.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.orders.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of Order class" do
      deal_id = create(:deal).id
      @order = build(:order, deal_id: deal_id)
      expect(client.orders.create(@order)).to be_instance_of BaseCRM::Order
    end
  end

  describe :find do
    before :each do
      @order = create_order
    end

    it "returns an instance of Order class" do
      expect(client.orders.find(@order.id)).to be_instance_of BaseCRM::Order
    end
  end

  describe :update do
    it "returns an updated instance of Order class" do
      @order = create_order
      expect(client.orders.update(@order)).to be_instance_of BaseCRM::Order
    end
  end

  describe :destroy do
    it "returns true on success" do
      @order = create_order
      expect(client.orders.destroy(@order.id)).to be_truthy
    end
  end

  def create_order
    deal = create(:deal)
    create(:order, deal_id: deal.id)
  end
end
