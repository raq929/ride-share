class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :lat, :precision => 15, :scale => 12, null: false
      t.decimal :lng,  :precision => 15, :scale => 12, null: false
      t.string :address, null: false

      t.timestamps null: false
    end
  end
end
