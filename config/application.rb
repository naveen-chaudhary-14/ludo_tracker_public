require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LudoTracker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])
    # config.action_mailer.delivery_method = :smtp
    # config.action_mailer.perform_deliveries = true
    # config.action_mailer.smtp_settings = {
    #   address: "smtp.gmail.com",
    #   port: 587,
    #   domain: "gmail.com",
    #   user_name: "naveenchaudharyreddoorz@gmail.com",
    #   password: "fsof xbcv kavb fpsf",
    #   authentication: "plain",
    #   enable_starttls_auto: true
    # }

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      user_name: 'apikey',                       # literally 'apikey'
      password: ENV['SEND_GRID_API_KEY'],         # check ENV variable name
      domain: 'ludo-cup.up.railway.app',        # your app domain
      address: 'smtp.sendgrid.net',
      port: 587,
      authentication: :plain,
      enable_starttls_auto: true
    }
    config.action_mailer.default_url_options = { host: 'ludo-cup.up.railway.app' }
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
