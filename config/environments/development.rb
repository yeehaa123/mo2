Mo2::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  # config.action_mailer.raise_delivery_errors = false

  # ActionMailer Config
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  # A dummy setup for development - no deliveries, but logged
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default charset: "utf-8"
  
  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin
  
  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = false

  ENV['FACEBOOK_KEY'] = "298374053604013";
  ENV['FACEBOOK_SECRET'] = "17fc0288d2f5f0f5fc201ff8e60651d5";

  ENV['GOOGLE_KEY'] = "917339117269.apps.googleusercontent.com";
  ENV['GOOGLE_SECRET'] = "_87ZqiSy7xFkf0WMJkjmG9CR";

  ENV['GITHUB_KEY'] = "506bb5b1135b7997ab56";
  ENV['GITHUB_SECRET'] = "dee4bbe236df4b4b666862100c5adb47d3a02618";
end
