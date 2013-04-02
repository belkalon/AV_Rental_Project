class Customer < ActiveRecord::Base
  attr_accessible :F_name, :L_name, :email, :phone
end
