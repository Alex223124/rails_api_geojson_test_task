class Area < ApplicationRecord

  has_many :points

  scope :given_areas, -> { where('is_given = true') }
  scope :areas_contains_points, -> (longitude, latitude) {
    where("ST_Intersects(ST_GeomFromText('POINT(? ?)', 4326), areas.polygon)",longitude, latitude)
  }

  after_commit :import_coordinates, if: -> { is_given.nil? &&
                                            (self.name.present? && self.points.blank?) }

  def self.polygons_contains_point?(basic_scope = "all", long, lat)
    case basic_scope
    when "all"
      areas_contains_points(long, lat).present?
    when "given_areas"
      given_areas.areas_contains_points(long, lat).present?
    end
  end

  def coordinates
    if polygon.present?
      polygon.coordinates
    elsif points.present?
      points.pluck(:latitude, :longitude)
    end
  end

  private

  def import_coordinates
    ImportCoordinatesWorker.perform_async(self.id)
  end

end