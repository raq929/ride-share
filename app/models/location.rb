class Location < ActiveRecord::Base
 has_many :destinations, :class_name => "Rides", foreign_key: :destination_id
 has_many :start_points, :class_name => "Rides", foreign_key: :start_point_id 
  validates :lat, presence: true
  validates :lng, presence: true
end
