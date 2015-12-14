class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.references :owner, null: false
      t.string :length
      t.string :event
      t.integer :spots_available, null: false
      t.string :departure_date_time
      t.references :destination, null: false
      t.references :start_point, null: false

      t.timestamps null: false
    end
  end
end
