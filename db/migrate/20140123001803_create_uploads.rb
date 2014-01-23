class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :file_name, :limit => 45
      t.boolean :complete, :default => false

      t.timestamps
    end
  end
end
