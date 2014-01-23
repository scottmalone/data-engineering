class Invoice < ActiveRecord::Base

  belongs_to :customer

  validates :customer_id, presence: true

  attr_accessible :customer_id
end
