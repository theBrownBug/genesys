# frozen_string_literal: true

Rails.application.config.session_store :active_record_store, key: (if Rails.env.production?
                                                                     '_team05_session_id'
                                                                   else
                                                                     (Rails.env.demo? ? '_team05_demo_session_id' : '_team05_dev_session_id')
                                                                   end),
                                                             secure: (Rails.env.demo? || Rails.env.production?),
                                                             httponly: true
