require 'spec_helper'

describe BaseCRM::LineItemsService do
  before(:all) do
    @product = create(:product)
    @order = create_order
  end
  describe 'Responds to' do
    subject { client.line_items  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :where }

  end

  describe :all do
    it "returns a PaginatedResource" do
      order_id = create_order.id
      expect(client.line_items.all(order_id)).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      order_id = create_order.id
      expect(client.line_items.where(order_id, page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of LineItem class" do
      order_id = create_order.id
      @line_item = build(:line_item, product_id: @product.id, order_id: @order.id)
      expect(client.line_items.create(order_id, @line_item)).to be_instance_of BaseCRM::LineItem
    end
  end

  describe :find do
    before :each do
      @line_item = create(:line_item, product_id: @product.id, order_id: @order.id)
    end

    it "returns an instance of LineItem class" do
      expect(client.line_items.find(@order.id, @line_item.id)).to be_instance_of BaseCRM::LineItem
    end
  end

  describe :destroy do
    it "returns true on success" do
      @line_item = create(:line_item, product_id: @product.id, order_id: @order.id)
      expect(client.line_items.destroy(@order.id, @line_item.id)).to be_truthy
    end
  end

  def create_order
    deal = create(:deal)
    create(:order, deal_id: deal.id)
  end
end
