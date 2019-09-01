class AreaPresenter < Presenter
  def as_json(*)
    {
        type: "Feature",
        properties: {},
        geometry: geometry
    }
  end


  def geometry
    RGeo::GeoJSON.encode(@object.polygon)
  end
end