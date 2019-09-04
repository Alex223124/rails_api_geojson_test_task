class ImportCoordinatesWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(id)
    area(id)
    coordinates
    @area.points.build(latitude: @coordinates.first, longitude: @coordinates.second)
    in_given
    @area.save!
  rescue StandardError => error
    Rails.logger.info "Error in Services::GeoJsonImport: #{error}"
  end

  private

  def coordinates
    @coordinates ||= Geocoder.search(@area.name).first.coordinates
  end

  def area(id)
    @area ||= Area.find(id)
  end

  def in_given
    if inside_given_locations?
      @area.in_given = true
    else
      @area.in_given = false
    end
  end

  def inside_given_locations?
    Area.polygons_contains_point?("given_areas", @coordinates.second, @coordinates.first)
  end

end