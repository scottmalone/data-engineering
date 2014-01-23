class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description, :limit => 255
      t.integer :price
      t.integer :merchant_id

      t.timestamps
    end
  end
end
