 class MetricsController < ApplicationController
    def create
        from = Time.at(params["pageVisitedFrom"].to_i / 1000).to_datetime
        to = Time.at(params["pageVisitedTo"].to_i / 1000).to_datetime
    
        Visit.create(from: from,
          to: to,
          path: params['path'],
          csrf_token: params['authenticity_token'],
          session_identifier: session.id
        )
    
        head :ok
    end
 end