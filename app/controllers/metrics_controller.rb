# frozen_string_literal: true

# Tracking of user metrics
# rubocop:disable Metrics/AbcSize
class MetricsController < ApplicationController
  def index
    sessions = Visit.where.not(path: '/metrics')
    @Locations = Visit.where.not(country: nil).where.not(path:'/metrics').pluck(:country).tally
    registrations = Register.all
    @Registrations = Register.where.not(country: nil).pluck(:country).tally
    @Metrics = {'Sessions' => sessions, 'Registrations' => registrations}
    @Clicks = Click.where(category: 'tier').where.not(value: nil).pluck(:value).tally
    @Clicks_2 = {'1' => Click.where(category: 'tier').where(value: '1'), '2' => Click.where(category: 'tier').where(value: '2') }
    
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
  
  def click
    session_id = params["session_id"]
    path = params["path"]
    category = params["category"]
    value = params["value"]
    Click.create(session_id: session_id,
                 path: path,
                 category: category,
                 value: value)
    head :ok 
    end
end
# rubocop:enable Metrics/AbcSize

