class MetricsController < ApplicationController
  def index
    @Metrics = Visit.all
  end
  def create
    from = Time.at(params["pageVisitedFrom"].to_i / 1000).to_datetime
    to = Time.at(params["pageVisitedTo"].to_i / 1000).to_datetime
    longitude = params["longitude"]
    latitude = params["latitude"]
    Visit.create(from: from,
                 to: to,
                 longitude: longitude,
                 latitude: latitude)
    head :ok
  end
end
