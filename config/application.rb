require_relative 'boot'

require 'rails/all'

#require "devise"

Bundler.require(*Rails.groups)

module OriginalApplication
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators do |g|
      g.test_framework :rspec,
                       model_specs: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
    end
    config.time_zone = "Africa/Porto-Novo"
    config.active_record.default_timezone = :local
  end
end
