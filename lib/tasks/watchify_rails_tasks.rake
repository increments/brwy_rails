# require "watchify_rails/runner"
namespace :watchify_rails do
  task :build => :environment do
    sh 'npm install'
    runner = WatchifyRails::Runner.new Rails.application.config.watchify_rails.merge watch: false
    runner.run
  end
end
