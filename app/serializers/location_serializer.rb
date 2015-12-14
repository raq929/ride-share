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

class LocationSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lng, :address
end
