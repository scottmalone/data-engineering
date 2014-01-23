require 'spec_helper'

describe Product do
  before(:each) do
    product = FactoryGirl.build(:product)
    @attr = {
      :description => product.description,
      :merchant_id => product.merchant_id,
      :price => product.price
    }
  end

  it "should create a new instance given a valid attribute" do
    Product.create!(@attr)
  end

  it "should not create a new instance given invalid description" do
    @attr[:description] = nil
    invalid_product = Product.new(@attr)
    invalid_product.should_not be_valid
  end

  it "should not create a new instance given invalid merchant_id" do
    @attr[:merchant_id] = nil
    invalid_product = Product.new(@attr)
    invalid_product.should_not be_valid
  end

  it "should not create a new instance given invalid price" do
    @attr[:price] = nil
    invalid_product = Product.new(@attr)
    invalid_product.should_not be_valid
  end
end
