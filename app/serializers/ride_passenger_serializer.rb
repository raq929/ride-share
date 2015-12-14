class RidePassengerSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user, serializer: 'UserSerializer'
end
