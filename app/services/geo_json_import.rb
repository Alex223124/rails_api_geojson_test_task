require 'json'
require 'rgeo/geo_json'


class Services::GeoJsonImport

  SIMPLE_MERCATOR_FACTORY = RGeo::Geographic.simple_mercator_factory.freeze
  FROM_GEO_JSON_FILE = {is_given: true}.freeze

  def initialize(file_path)
    @file = File.read(file_path)
  end

  def run
    geojson_to_areas(@file)
  rescue StandardError => error
    puts "Error in Services::GeoJsonImport: #{error}"
    Rails.logger.info "Error in Services::GeoJsonImport: #{error}"
  end

  private

  def geojson_to_areas(json_str)
    geo_json = RGeo::GeoJSON.decode(json_str, :json_parser => :json, :geo_factory => SIMPLE_MERCATOR_FACTORY)
    build_areas(geo_json)
  end

  def build_areas(geo_json)
    geo_json.each do |feature|
      Area.create!(polygon: feature.geometry.projection, is_given: FROM_GEO_JSON_FILE[:is_given])
    end
  end

end