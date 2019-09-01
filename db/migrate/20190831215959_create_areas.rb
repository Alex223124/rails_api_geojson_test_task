class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      # t.st_polygon :polygon, :geometry => true, :srid => 3857
      t.st_polygon :polygon, :geometry => true, :srid => 4326
      # 4326
      t.timestamps
    end
  end
end