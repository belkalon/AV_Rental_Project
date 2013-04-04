class Inventory < ActiveRecord::Base
  attr_accessible :equipment_name, :equipment_type, :num_of_items, :rental_price
	has_many :rental, :dependent => :destroy
end
