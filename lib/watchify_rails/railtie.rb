module WatchifyRails
  class Railtie < Rails::Engine
    # options
    config.watchify_rails = ActiveSupport::OrderedOptions.new
    config.watchify_rails.browserify_opts = "-t babelify"
    # TODO: Don't change tmpdir because it can't affect to asset.paths
    config.watchify_rails.tmpdir = "tmp/cache/watchify_rails"
    config.watchify_rails.targets = []
    config.watchify_rails.verbose = true
    config.watchify_rails.target_suffix = ".bundle.js"
    config.watchify_rails.watch = Rails.env.development?

    initializer :assets do |config|
      Rails.application.config.assets.paths << Rails.root.join("tmp/cache/watchify_rails")
    end

    config.after_initialize do
      runner = Runner.new config.watchify_rails
      runner.run
    end
  end
end
