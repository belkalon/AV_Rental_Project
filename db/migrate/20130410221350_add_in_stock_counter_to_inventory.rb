class AddInStockCounterToInventory < ActiveRecord::Migration
  def change
		#add num_in_stock column to inventory table
		add_column :inventories, :num_in_stock, :integer
  end
end
