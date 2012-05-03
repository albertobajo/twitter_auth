require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../dummy/config/environment", __FILE__)

  require "database_cleaner"
  require "factory_girl_rails"
  require "omniauth"
  require 'rspec/rails'
  require 'rspec/autorun'
  require "shoulda"

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    

    # DatabaseCleaner
    DatabaseCleaner.strategy = :truncation
    
    # FactoryGirl syntax methods
    config.include FactoryGirl::Syntax::Methods
    
    # Omniauth test mode
    OmniAuth.config.test_mode = true

    # Omniauth mock_auth  
    json = File.read(Rails.root.join("../../lib/files/16789004997.json"))
    raw_info = JSON.parse(json)
    OmniAuth.config.mock_auth[:twitter] = {
      provider: 'twitter',
      uid:      '16789004997',
      info: {
        name:     'Matt Harris',
        nickname: 'themattharris'
      },
      credentials: {
        token:    '1234567890',
        secret:   '12345678901234567890'
      },
      extra: {
        raw_info: raw_info
      }
    }
    
  end

end

Spork.each_run do
  DatabaseCleaner.clean

end