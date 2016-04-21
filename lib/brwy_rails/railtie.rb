module BrwyRails
  class Railtie < Rails::Engine
    # options
    config.brwy_rails = ActiveSupport::OrderedOptions.new
    config.brwy_rails.browserify_opts = ""
    config.brwy_rails.tmpdir = "tmp/cache/brwy_rails"
    config.brwy_rails.targets = []
    config.brwy_rails.verbose = true
    config.brwy_rails.poll = false
    config.brwy_rails.polling_interval = 1000
    config.brwy_rails.target_suffix = ".bundle"
    config.brwy_rails.watch = Rails.env.development?

    initializer :assets do
      Rails.application.config.assets.paths << Rails.root.join(Rails.application.config.brwy_rails.tmpdir)
    end

    config.after_initialize do
      runner = Runner.new config.brwy_rails
      runner.run
    end
  end
end
