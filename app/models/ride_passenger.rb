# == Schema Information
#
# Table name: ride_passengers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#  ride_id    :integer          not null
#

class RidePassenger < ActiveRecord::Base
  belongs_to :ride
  belongs_to :user
  validates :user_id, presence: true
  validates :ride_id, presence: true
  validates :user_id, uniqueness: {scope: :ride_id}
end
