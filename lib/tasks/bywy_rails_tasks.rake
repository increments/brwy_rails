# require "brwy_rails/runner"
namespace :brwy_rails do
  task :build => :environment do
    sh 'npm install'
    runner = BrwyRails::Runner.new Rails.application.config.brwy_rails.merge watch: false
    runner.run
  end
end

task 'assets:precompile' => ['brwy_rails:build']
