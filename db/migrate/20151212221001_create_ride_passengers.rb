class CreateRidePassengers < ActiveRecord::Migration
  def change
    create_table :ride_passengers do |t|
      
      t.timestamps null: false
    end
  end
end
