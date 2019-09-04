class ShowAreaPresenter < Presenter

  def as_json(*)
    {
        location_name: @object.name,
        coordinates: @object.coordinates,
        inside?: @object.in_given
    }
  end

end