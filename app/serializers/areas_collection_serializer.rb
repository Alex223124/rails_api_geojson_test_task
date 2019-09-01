class AreasCollectionSerializer < Surrealist::Serializer

  json_schema { {
      type: String,
      features: Array
  } }

  def type
    binding.pry
    "FeatureCollection"
  end

  def features
    [JSON.parse(AreaSerializer.new(object).surrealize)]
  end
end