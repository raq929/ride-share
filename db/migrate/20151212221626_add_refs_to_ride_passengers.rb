class AddRefsToRidePassengers < ActiveRecord::Migration
  def change
    add_reference :ride_passengers, :user, index: true, foreign_key: true, null: false
    add_reference :ride_passengers, :ride, index: true, foreign_key: true, null: false
  end
end
