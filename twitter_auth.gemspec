$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "twitter_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "twitter_auth"
  s.version     = TwitterAuth::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TwitterAuth."
  s.description = "TODO: Description of TwitterAuth."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "hashie", "~> 1.2.0"
  s.add_dependency "rails", "~> 3.2.3"

  s.add_development_dependency "capybara"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner", "~> 0.7.2"
  s.add_development_dependency "guard-cucumber"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "shoulda", "~> 3.0.1"
end
