class Area < ApplicationRecord

  geocoded_by :name

  after_commit :import_coordinates, if: -> { latitude.nil? && longitude.nil? }

  private

  def import_coordinates
    ImportCoordinatesWorker.perform_async(self.id)
  end

end