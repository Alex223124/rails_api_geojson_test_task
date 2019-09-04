class RemoveLatitudeAndLongitudeFromAreas < ActiveRecord::Migration[5.2]
  def change
    remove_column :areas, :latitude, :float
    remove_column :areas, :longitude, :float
  end
end
