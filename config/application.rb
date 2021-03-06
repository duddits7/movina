require File.expand_path('../boot', __FILE__)


ENV['RANSACK_FORM_BUILDER'] = '::SimpleForm::FormBuilder'

require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Movina
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
	  #

#    config.generator do |g|
#      g.template_engine :haml
#    end


    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    config.time_zone = 'Novosibirsk'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ru

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.active_job.queue_adapter = :delayed_job


    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    config.cache_store = :redis_store, 'redis://localhost:6379/1/cache', { expires_in: 90.minutes }

#    config.autoload_paths += "#{Rails.root}/app/uploaders"

  end
end
