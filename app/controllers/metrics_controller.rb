# frozen_string_literal: true

# Tracking of user metrics
# rubocop:disable Metrics/AbcSize
class MetricsController < ApplicationController
  def create
    from = Time.zone.at(params['pageVisitedFrom'].to_i / 1000).to_datetime
    to = Time.zone.at(params['pageVisitedTo'].to_i / 1000).to_datetime

    Visit.create(
      from: from,
      to: to,
      path: params['path'],
      csrf_token: params['authenticity_token'],
      session_identifier: session.id
    )

    head :ok
  end
end
# rubocop:enable Metrics/AbcSize
