class Customer < ActiveRecord::Base

  has_many :invoices

  validates :name, presence: true

  attr_accessible :name
end
