class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :equipment_type
      t.string :equipment_name
      t.integer :num_of_items
      t.float :rental_price

      t.timestamps
    end
  end
end
