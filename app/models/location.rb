# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  lat        :decimal(15, 12)  not null
#  lng        :decimal(15, 12)  not null
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
 has_many :destinations, :class_name => "Rides", foreign_key: :destination_id
 has_many :start_points, :class_name => "Rides", foreign_key: :start_point_id 
  validates :lat, presence: true
  validates :lng, presence: true
end
