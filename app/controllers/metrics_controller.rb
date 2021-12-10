# frozen_string_literal: true

# Tracking of user metrics
# rubocop:disable Metrics/AbcSize
class MetricsController < ApplicationController
  CATEGORY_FAQ = 'FAQ'
  CATEGORY_FEATURE = 'feature'
  CATEGORY_TIER = 'tier'
  CATEGORY_SOCIALS = %w[email facebook twitter]
  def index
    session_ids = Visit.select(:session_id).distinct.pluck(:session_id)

    @locations = Visit.where.not(country: nil).where(path: '/').pluck(:country).tally

    @registrations = Register.where.not(country: nil).pluck(:country).tally

    sessions = Visit.where(path: '/')

    registrations = Register.all
    @metrics = { 'Sessions' => sessions, 'Registrations' => registrations }

    tier1 = Click.where(category: CATEGORY_TIER).where(value: '1')
    tier2 = Click.where(category: CATEGORY_TIER).where(value: '2')
    @pricing = { '1' => tier1, '2' => tier2 }

    @features = Click.where(category: CATEGORY_FEATURE).where.not(value: nil).pluck(:value).tally
    @features_time = Click.where(category: CATEGORY_FAQ).where.not(value: nil)

    @socials = Click.where(category: CATEGORY_SOCIALS).where.not(value: nil).group(:value, :category).count
    social_keys = Click.where(category: CATEGORY_SOCIALS).where.not(value: nil).group(:value).count
    @social_keys = social_keys.keys

    @reviews = Review.order(likes: :desc).limit(5)

    @questions = Click.where(category: CATEGORY_FAQ).where.not(value: nil).limit(5).pluck(:value).tally
    @question_body = Question.where(id: @questions.keys)
    @questions_time = Click.where(category: CATEGORY_FAQ).where.not(value: nil)
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
                 country: location.first ? location.first.country : nil,
                 session_id: session.id)
    head :ok
  end

  def click
    session_id = session.id
    path = params['path']
    category = params['category']
    value = params['value']
    Click.create(session_id: session_id,
                 path: path,
                 category: category,
                 value: value)
    head :ok
  end
    def register_params
      params.require(:register).permit(:email, :option, :lat, :long)
    end
end
# rubocop:enable Metrics/AbcSize
