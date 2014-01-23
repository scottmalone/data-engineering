require 'spec_helper'

describe Merchant do
  before(:each) do
    merchant = FactoryGirl.build(:merchant)
    @attr = {
      :name => merchant.name,
      :address => merchant.address
    }
  end

  it "should create a new instance given a valid attribute" do
    Merchant.create!(@attr)
  end

  it "should not create a new instance given invalid name" do
    @attr[:name] = nil
    invalid_merchant = Merchant.new(@attr)
    invalid_merchant.should_not be_valid
  end

  it "should not create a new instance given invalid address" do
    @attr[:address] = nil
    invalid_merchant = Merchant.new(@attr)
    invalid_merchant.should_not be_valid
  end
end
