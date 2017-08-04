require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Crafters
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.active_record.schema_format = :sql
    # Precompile additional assets.
    # application.js, application.css.scss, and all non-JS/CSS in app/assets folder are already added.
    # config.assets.precompile += %w( bx_loader.gif controls.png )
    # config.assets.precompile += %w( fonts/flexslider-icon.eot fonts/flexslider-icon.woff fonts/flexslider-icon.ttf )
    # config.assets.precompile += %w( flexslider-icon.eot flexslider-icon.woff flexslider-icon.ttf )
  end
end
