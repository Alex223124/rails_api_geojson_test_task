class AddIsGivenToAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :is_given, :boolean
  end
end
