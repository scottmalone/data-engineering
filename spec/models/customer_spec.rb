require 'spec_helper'

describe Customer do
  before(:each) do
    @customer = FactoryGirl.create(:customer)
  end

  it "should create a new instance given a valid attribute" do
    @customer
  end

  it "should not create a new instance given invalid attributes" do
    invalid_customer = Customer.new(:name => nil)
    invalid_customer.should_not be_valid
  end
end
