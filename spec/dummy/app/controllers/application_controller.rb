class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
    def after_create_path
      "/"
    end
    
end
