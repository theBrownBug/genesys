# frozen_string_literal: true

# Tracking of user metrics
# rubocop:disable Metrics/AbcSize
class MetricsController < ApplicationController
  def index
    Review.create(body:"good stuff", rating: 5, likes:10, is_live: false, is_live_landing:false,title:"good stuff still")

    sessions = Visit.where.not(path: '/metrics')
    @locations = Visit.where.not(country: nil).where.not(path: '/metrics').pluck(:country).tally
    registrations = Register.all
    @registrations = Register.where.not(country: nil).pluck(:country).tally
    @metrics = { 'Sessions' => sessions, 'Registrations' => registrations }
    tier1 = Click.where(category: 'tier').where(value: '1')
    tier2 = Click.where(category: 'tier').where(value: '2')
    @pricing = { '1' => tier1, '2' => tier2 }

    @features = Click.where(category: 'feature').where.not(value: nil).pluck(:value).tally
    @features_time = Click.where(category: 'feature').where.not(value: nil)

    @socials = Click.where(category: %w[email facebook twitter]).where.not(value: nil).group(:value, :category).count
    social_keys = Click.where(category: %w[email facebook twitter]).where.not(value: nil).group(:value).count
    @social_keys = social_keys.keys
    Rails.logger.debug '=====Clicks_2======='
    @test = Click.where(category: 'tier').where(value: '1')
    Rails.logger.debug @test
  end

  def create
    from = Time.zone.at(params['pageVisitedFrom'].to_i / 1000).to_datetime
    to = Time.zone.at(params['pageVisitedTo'].to_i / 1000).to_datetime
    path = params['path']
    longitude = params['longitude']
    latitude = params['latitude']
    location = Geocoder.search([latitude, longitude])
    Visit.create(from: from,
                 to: to,
                 path: path,
                 longitude: longitude,
                 latitude: latitude,
                 country: location.first.country)
    head :ok
  end

  def click
    session_id = params['session_id']
    path = params['path']
    category = params['category']
    value = params['value']
    Rails.logger.debug category
    Click.create(session_id: session_id,
                 path: path,
                 category: category,
                 value: value)
    head :ok
  end
end
# rubocop:enable Metrics/AbcSize
