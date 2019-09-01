class AreaSerializer < Surrealist::Serializer
  
  json_schema { {
      type: String,
      properties: Hash,
      geometry: Hash

  } }

  def type
    "Feature"
  end

  def properties
    {}
  end

  def geometry
    binding.pry
    RGeo::GeoJSON.encode(object.polygon)
  end
end