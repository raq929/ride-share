class LocationsSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lng, :address
end
