module WatchifyRails
  class Railtie < Rails::Engine
    # options
    config.watchify_rails = ActiveSupport::OrderedOptions.new
    config.watchify_rails.browserify_opts = "-t babelify"
    # TODO: Don't change tmpdir because it can't affect to asset.paths
    config.watchify_rails.tmpdir = "tmp/watchify_rails"
    config.watchify_rails.targets = []
    config.watchify_rails.verbose = true
    config.watchify_rails.watch = Rails.env.development?

    initializer :assets do |config|
      # TODO: Hard code now. Fix it.
      # Rails.application.config.assets.paths.unshift(Rails.root.join(config.watchify_rails.tmpdir))
      Rails.application.config.assets.paths.unshift(Rails.root.join("tmp/watchify_rails"))
    end

    config.after_initialize do
      runner = Runner.new config.watchify_rails
      runner.run
    end
  end
end
