class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.references :customer
      t.references :inventory
      t.integer :quantity
      t.date :return_date
      t.string :event_name

      t.timestamps
    end
    add_index :rentals, :customer_id
    add_index :rentals, :inventory_id
  end
end
