module BrwyRails
  class Railtie < Rails::Engine
    # options
    config.brwy_rails = ActiveSupport::OrderedOptions.new
    config.brwy_rails.browserify_opts = ""
    # TODO: Don't change tmpdir because it can't affect to asset.paths
    config.brwy_rails.tmpdir = "tmp/cache/brwy_rails"
    config.brwy_rails.targets = []
    config.brwy_rails.verbose = true
    config.brwy_rails.target_suffix = ".bundle.js"
    config.brwy_rails.watch = Rails.env.development?

    initializer :assets do |config|
      Rails.application.config.assets.paths << Rails.root.join("tmp/cache/brwy_rails")
    end

    config.after_initialize do
      runner = Runner.new config.brwy_rails
      runner.run
    end
  end
end
