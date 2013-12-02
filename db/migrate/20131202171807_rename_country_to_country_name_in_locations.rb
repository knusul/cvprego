class RenameCountryToCountryNameInLocations < ActiveRecord::Migration
  def change
    add_column :locations, :created_at, :datetime
    rename_column :locations, :country, :country_name
  end
end
