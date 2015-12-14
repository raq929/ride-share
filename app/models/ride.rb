# == Schema Information
#
# Table name: rides
#
#  id                  :integer          not null, primary key
#  owner_id            :integer          not null
#  length              :string
#  event               :string
#  spots_left          :integer          not null
#  departure_date_time :string
#  destination_id      :integer          not null
#  start_point_id      :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Ride < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  has_many :passenger, through: :ride_passengers
  belongs_to :destination, :class_name => 'Location', :foreign_key => 'destination_id'
  belongs_to :start_point, :class_name => 'Location', :foreign_key => 'start_point_id'
  
  validates :destination, presence: true
  validates :start_point, presence: true
  validates :owner, presence: true
  validates :spots_left, presence: true
  validates :departure_date_time, presence: true

end
