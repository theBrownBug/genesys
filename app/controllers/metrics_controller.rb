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
    tier_1 = Click.where(category: 'tier').where(value: '1')
    tier_2 = Click.where(category: 'tier').where(value: '2') 
    @pricing = {'1' => tier_1, '2' => tier_2}

    @features = Click.where(category: 'feature').where.not(value: nil).pluck(:value).tally
    @features_time = Click.where(category: 'feature').where.not(value: nil)

    @socials = Click.where(category: ['email', 'facebook', 'twitter']).where.not(value: nil).group(:value, :category).count
    social_keys = Click.where(category: ['email', 'facebook', 'twitter']).where.not(value: nil).group(:value).count
    @social_keys = social_keys.keys
    puts "=====Clicks_2======="
    @test = Click.where(category: 'tier').where(value: '1')
    puts @test
  end

  def create 
    puts "hello there"
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
    puts category
    Click.create(session_id: session_id,
                 path: path,
                 category: category,
                 value: value)
    head :ok 
    end
end
# rubocop:enable Metrics/AbcSize

