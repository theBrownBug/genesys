Raven.configure do |config|
  # Sentry is only enabled when the dsn is set.
  unless Rails.env.development? || Rails.env.test?
    config.dsn = 'REPLACE_WITH_YOUR_DSN'
  end

  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  config.excluded_exceptions += ["CanCan::AccessDenied", "SystemExit", 'ActionDispatch::Http::MimeNegotiation::InvalidType']
end
