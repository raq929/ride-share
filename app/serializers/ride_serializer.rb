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

class RideSerializer < ActiveModel::Serializer
  attributes :id, :length, :spots_available, :departure_date_time 
  has_one :owner, serializer: UserSerializer
  has_one :destination, serializer: LocationSerializer
  has_one :start_point, serializer: LocationSerializer
  has_many :passengers, class_name: 'User', serializer: UserSerializer
end
