$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "brwy_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "brwy_rails"
  s.version     = BrwyRails::VERSION
  s.authors     = ["Koutarou Chikuba"]
  s.email       = ["miz404@gmail.com"]
  s.homepage    = "https://github.com/mischi"
  s.summary     = "browserify/watchify on Rails"
  s.description = "Use watchify on development and compile with browserify at release"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end
