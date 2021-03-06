require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PracticaCinco
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

# para cambiar el locale, pr 5
# config.i18n.default_locale = :'es-AR' 
Rails.application.configure do
  config.time_zone = 'Buenos Aires' 
  config.i18n.default_locale = :'es-AR' 
end