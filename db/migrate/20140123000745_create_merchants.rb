class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name, :limit => 30
      t.string :address, :limit => 50

      t.timestamps
    end
  end
end
