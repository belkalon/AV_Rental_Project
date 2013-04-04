class Rental < ActiveRecord::Base
  belongs_to :customer
  belongs_to :inventory
  attr_accessible :event_name, :quantity, :return_date
end
