require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LendBike
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Set timezone
    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false

    config.responders.flash_keys = [:notice, :alert]

    # Include helpers from current controller only
    config.action_controller.include_all_helpers = false

    config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
    config.i18n.default_locale = 'pt-BR'
  end
end
