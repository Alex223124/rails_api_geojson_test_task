class AddInGivenToAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :in_given, :boolean
  end
end
