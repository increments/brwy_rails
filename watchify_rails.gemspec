$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "watchify_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "watchify_rails"
  s.version     = WatchifyRails::VERSION
  s.authors     = ["Koutarou Chikuba"]
  s.email       = ["miz404@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of WatchifyRails."
  s.description = "TODO: Description of WatchifyRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end
