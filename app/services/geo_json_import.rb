require 'json'
require 'rgeo/geo_json'


class Services::GeoJsonImport

  def initialize(file_path)
    @file_path = file_path
  end

  def run
    file = File.read(@file_path)
    geojson_to_areas(file)
  end

  private

  def geojson_to_areas(json_str)
    geo_factory = RGeo::Geographic.simple_mercator_factory
    geo_json = RGeo::GeoJSON.decode(json_str, :json_parser => :json, :geo_factory => geo_factory)
    # should be iteration!!! 
    a = Area.new(polygon: geo_json.first.geometry.projection)
    a.save
  end

end