Rails.application.config.session_store :active_record_store, key: (Rails.env.production? ? '_team05_session_id' : (Rails.env.demo? ? '_team05_demo_session_id' : '_team05_dev_session_id')),
                                                             secure: (Rails.env.demo? || Rails.env.production?),
                                                             httponly: true
