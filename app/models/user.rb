# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  token           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

#
class User < ActiveRecord::Base
  include Authentication

  has_many :rides, :class_name => 'Ride', :foreign_key => 'owner_id'
  has_many :ride_passengers, through: :rides
end
