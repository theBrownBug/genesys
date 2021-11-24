# frozen_string_literal: true

# Tracking of user metrics
# rubocop:disable Metrics/AbcSize
class MetricsController < ApplicationController
  def index
    @Metrics = Visit.where.not(path: '/metrics')
    @Locations = Visit.where.not(country: nil).where.not(path:'/metrics').pluck(:country).tally
    print(@Metrics)
    print(@Locations)
   end

  def create
    from = Time.at(params["pageVisitedFrom"].to_i / 1000).to_datetime
    to = Time.at(params["pageVisitedTo"].to_i / 1000).to_datetime
    path = params["path"]
    longitude = params["longitude"]
    latitude = params["latitude"]
    location = Geocoder.search([latitude, longitude])
    Visit.create(from: from,
                 to: to,
                 path:path,
                 longitude: longitude,
                 latitude: latitude,
                 country: location.first.country)
    head :ok
  end
end
# rubocop:enable Metrics/AbcSize

