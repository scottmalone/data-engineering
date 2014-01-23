require 'spec_helper'

describe Invoice do
  it "should create a new instance given a valid attribute" do
    FactoryGirl.create(:invoice)
  end

  it "should not create a new instance given invalid attributes" do
    invalid_invoice = FactoryGirl.build(:invoice)
    invalid_invoice.customer_id = nil
    invalid_invoice.should_not be_valid
  end
end
