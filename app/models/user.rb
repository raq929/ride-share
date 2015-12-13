#
class User < ActiveRecord::Base
  include Authentication

  has_many :rides, :class_name => 'Ride', :foreign_key => 'owner_id'
  has_many :ride_passengers, through: :rides
end
