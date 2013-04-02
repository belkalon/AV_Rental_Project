class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :F_name
      t.string :L_name
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
