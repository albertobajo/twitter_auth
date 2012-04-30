class TwitterAuth::SessionsController < ApplicationController
  def new
    redirect_to "/twitter_auth/twitter"
  end

  def create
    user = ::User.find_or_create_by_auth_hash(auth_hash)
    redirect_back_or after_create_path
  end

  def destroy
  end
  
  protected
  
    def auth_hash
      request.env['omniauth.auth']
    end
  
    def after_create_path
      "/"
    end
end
