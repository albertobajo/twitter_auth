require "omniauth-twitter"

module TwitterAuth
  class Engine < ::Rails::Engine
    initializer 'twitter_auth.authentication' do |app|
      ActiveSupport.on_load(:action_controller) do
        include TwitterAuth::Authentication
      end
    end
    
    initializer 'omniauth.twitter' do |app|
      app.middleware.use OmniAuth::Builder do
        configure do |config|
          config.path_prefix = '/twitter_auth'
        end
        
        provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']        
      end
    end
    
    config.generators do |g|
      g.template_engine :haml                               
      g.test_framework :rspec, :view_specs => false
    end
  end
end
