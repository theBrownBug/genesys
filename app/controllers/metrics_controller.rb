class MetricsController < ApplicationController
  def index
    @Metrics = Visit.all
    @Locations = Visit.where.not(country: nil).pluck(:country).tally
    print(@Metrics)
    print(@Locations)
   end

  def create
    from = Time.at(params["pageVisitedFrom"].to_i / 1000).to_datetime
    to = Time.at(params["pageVisitedTo"].to_i / 1000).to_datetime
    longitude = params["longitude"]
    latitude = params["latitude"]
    location = Geocoder.search([latitude, longitude])
    Visit.create(from: from,
                 to: to,
                 longitude: longitude,
                 latitude: latitude,
                 country: location.first.country)
    head :ok
  end
end
