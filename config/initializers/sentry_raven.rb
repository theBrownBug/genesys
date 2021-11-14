# frozen_string_literal: true

Raven.configure do |config|
  # Sentry is only enabled when the dsn is set.
  config.dsn = 'REPLACE_WITH_YOUR_DSN' unless Rails.env.development? || Rails.env.test?

  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  config.excluded_exceptions += ['CanCan::AccessDenied', 'SystemExit',
                                 'ActionDispatch::Http::MimeNegotiation::InvalidType']
end
