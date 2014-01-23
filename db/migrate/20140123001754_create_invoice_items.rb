class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :invoice_id
      t.integer :product_id
      t.integer :quantity
      t.integer :current_price

      t.timestamps
    end
  end
end
