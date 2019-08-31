class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.spatial :polygon, type: :polygon, srid: 3785, geometry: true
      t.timestamps
    end
  end
end