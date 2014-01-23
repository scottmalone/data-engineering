class InvoiceItem < ActiveRecord::Base

  belongs_to :invoice
  belongs_to :product

  validates :current_price, presence: true
  validates :invoice_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true

  attr_accessible :current_price, :invoice_id, :product_id, :quantity

  def self.total
    '%.2f' % (all.inject(0) {|c,i| c += i.quantity * i.current_price})
  end
end
