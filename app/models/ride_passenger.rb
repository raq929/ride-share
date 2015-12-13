class RidePassenger < ActiveRecord::Base
  belongs_to :ride
  belongs_to :user
  validates :user_id, presence: true
  validates :ride_id, presence: true
  validates :user_id, uniqueness: {scope: :ride_id}
end
