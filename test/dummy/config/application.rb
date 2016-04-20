require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)
require "brwy_rails"

module Dummy
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    # precompile
    config.assets.paths << Rails.root.join("tmp/cache/brwy_rails").to_s
    config.assets.precompile = ["application.bundle.js", "application.css"]
    config.assets.js_compressor = nil

    # brwy_rails
    config.brwy_rails.targets = [
      "app/assets/javascripts/application.js"
    ]
  end
end
