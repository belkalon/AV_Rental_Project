class Rental < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :customer
  attr_accessible :event_name, :quantity, :return_date
end
