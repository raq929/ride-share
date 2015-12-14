class AddIndexToRidePassengers < ActiveRecord::Migration
  def change
    add_index :ride_passengers, [:user_id, :ride_id], unique: true
  end
end
