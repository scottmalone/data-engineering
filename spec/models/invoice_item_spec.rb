require 'spec_helper'

describe InvoiceItem do
  before(:each) do
    invoice_item = FactoryGirl.build(:invoice_item)
    @attr = {
      :invoice_id => invoice_item.invoice_id,
      :product_id => invoice_item.product_id,
      :quantity => invoice_item.quantity,
      :current_price => invoice_item.current_price
    }
  end

  it "should create a new instance given a valid attribute" do
    InvoiceItem.create!(@attr)
  end

  it "should not create a new instance given invalid invoice_id" do
    @attr[:invoice_id] = nil
    invalid_invoice_item = InvoiceItem.new(@attr)
    invalid_invoice_item.should_not be_valid
  end

  it "should not create a new instance given invalid product_id" do
    @attr[:product_id] = nil
    invalid_invoice_item = InvoiceItem.new(@attr)
    invalid_invoice_item.should_not be_valid
  end

  it "should not create a new instance given invalid quantity" do
    @attr[:quantity] = nil
    invalid_invoice_item = InvoiceItem.new(@attr)
    invalid_invoice_item.should_not be_valid
  end

  it "should not create a new instance given invalid current_price" do
    @attr[:current_price] = nil
    invalid_invoice_item = InvoiceItem.new(@attr)
    invalid_invoice_item.should_not be_valid
  end
end
