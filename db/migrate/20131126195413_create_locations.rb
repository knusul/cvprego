class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :country
      t.string :longitude
      t.string :latitude
      t.integer :user_id

      t.timestamps
    end
  end
end
