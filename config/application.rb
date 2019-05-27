require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Planta2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
   #  config.load_defaults 5.2

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.locale = :es
    config.i18n.default_locale = :es
    config.assets.initialize_on_precompile = false
    #config.i18n.enforce_available_locales = false

    config.time_zone = 'America/Santiago'
end
end