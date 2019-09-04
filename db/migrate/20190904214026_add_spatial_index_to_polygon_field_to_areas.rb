class AddSpatialIndexToPolygonFieldToAreas < ActiveRecord::Migration[5.2]
  def change
    # add_index :areas, :polygon, :name => "index_areas_on_polygon", :spatial => true
    add_index :areas, :polygon, :name => "index_areas_on_polygon", using: :gist
    # add_index "areas", ["polygon"], :name => "index_areas_on_polygon", :spatial => true
  end
end

