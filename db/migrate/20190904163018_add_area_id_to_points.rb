class AddAreaIdToPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :points, :area_id, :integer
  end
end
