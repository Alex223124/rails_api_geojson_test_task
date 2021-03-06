require 'pry'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Area.delete_all
Point.delete_all
path_to_given_areas = "#{Rails.root}/db/seeds/given_areas.json"
Services::GeoJsonImport.new(path_to_given_areas).run