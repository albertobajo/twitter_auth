class TwitterAuth::SessionsController < ApplicationController
  unloadable
  
  def new
    redirect_to "/twitter_auth/twitter"
  end

  def create
    @user = ::User.find_or_create_by_auth_hash(auth_hash)
    sign_in(@user)
    redirect_back_or after_signin_path
  end

  def destroy
    reset_session
    redirect_to after_signout_path
  end
  
  protected
  
    def auth_hash
      request.env['omniauth.auth']
    end
  
end
