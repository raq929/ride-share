class LocationSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lng, :address
end
