# require "brwy_rails/runner"
namespace :brwy_rails do
  task :npm_setup do
    unless File.exists? Rails.root.join("package.json")
      sh 'npm init -y'
    end
    sh 'npm install -D watchify browserify'
  end

  task :build => :environment do
    sh 'npm install'
    runner = BrwyRails::Runner.new Rails.application.config.brwy_rails.merge watch: false
    runner.run
  end
end

task 'assets:precompile' => ['brwy_rails:build']
