class InitNumInStockToNumOfItems < ActiveRecord::Migration
  def up
		#destroy all tuples in rental table to meet assumption of no rentals in update code
		Rental.all.each do |r|
			r.destroy
		end

		#WARNING: this assumes there are currently no items rented out. if there are, this funcitonality WON'T work
		Inventory.all.each do |e|
			e.num_in_stock = e.num_of_items
			e.save
		end
  end

  def down
		#can't re-create rentals we know nothing about, sorry
		Inventory.all.each do |e|
			e.num_in_stock = nil
			e.save
		end
  end
end
