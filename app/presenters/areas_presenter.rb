class AreasPresenter < Presenter

  def as_json(*)
    {
        type: "FeatureCollection",
        features: features
    }
  end

  def features
    @object.map { |o| AreaPresenter.new(o) }
  end

end
