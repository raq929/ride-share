#
class User < ActiveRecord::Base
  include Authentication

  has_many :rides
  has_many :ride_passengers, through: :rides
end
