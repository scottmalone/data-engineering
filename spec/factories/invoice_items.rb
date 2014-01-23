# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice_item do
    invoice
    product
    quantity 1
    current_price 1
  end
end
