class ImportCoordinatesWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(id)
    area = Area.find(id)
    area.geocode
    raise Exception, "Something went wrong" if area.latitude.nil? && area.logitude.nil?
    area.save!
  end

end