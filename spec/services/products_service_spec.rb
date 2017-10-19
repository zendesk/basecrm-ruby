require 'spec_helper'

describe BaseCRM::ProductsService do
  describe 'Responds to' do
    subject { client.products  }

    it { should respond_to :all }
    it { should respond_to :create }
    it { should respond_to :destroy }
    it { should respond_to :find }
    it { should respond_to :update }
    it { should respond_to :where }
 
  end

  describe :all do
    it "returns a PaginatedResource" do
      expect(client.products.all()).to be_instance_of BaseCRM::PaginatedResource
    end
  end

  describe :where do
    it "returns an array" do
      expect(client.products.where(page: 1)).to be_an Array
    end
  end

  describe :create do
    it "returns instance of Product class" do
      @product = build(:product)
      expect(client.products.create(@product)).to be_instance_of BaseCRM::Product
    end
  end

  describe :find do
    before :each do
      @product = create(:product) 
    end

    it "returns an instance of Product class" do
      expect(client.products.find(@product.id)).to be_instance_of BaseCRM::Product
    end
  end

  describe :update do
    it "returns an updated instance of Product class" do
      @product = create(:product)
      expect(client.products.update(@product)).to be_instance_of BaseCRM::Product
    end
  end

  describe :destroy do
    it "returns true on success" do
      @product = create(:product)
      expect(client.products.destroy(@product.id)).to be_truthy
    end
  end
end
