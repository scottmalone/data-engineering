# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    description "MyString"
    price 1
    merchant
  end
end
