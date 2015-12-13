class RideSerializer < ActiveModel::Serializer
  attributes :id, :length, :spots_left, :departure_date_time 
  has_one :owner, serializer: UserSerializer
  has_one :destination, serializer: LocationSerializer
  has_one :start_point, serializer: LocationSerializer
end
