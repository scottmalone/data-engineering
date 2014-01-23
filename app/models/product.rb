class Product < ActiveRecord::Base

  belongs_to  :merchant

  validates :description, presence: true
  validates :merchant_id, presence: true
  validates :price, presence: true

  attr_accessible :description, :merchant_id, :price
end
