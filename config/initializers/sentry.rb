Sentry.init do |config|
  config.dsn = 'https://e95984fe12f246a2b0818f2bfa6cbc40@o481868.ingest.sentry.io/5531203'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = 0.5
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end