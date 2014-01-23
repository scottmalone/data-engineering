class Merchant < ActiveRecord::Base

  has_many  :products

  validates :name, presence: true
  validates :address, presence: true

  attr_accessible :address, :name
end
