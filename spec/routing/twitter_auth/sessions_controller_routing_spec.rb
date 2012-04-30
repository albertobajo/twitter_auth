require 'spec_helper'

describe TwitterAuth::SessionsController do
  describe "routing" do    
    it { get("twitter_auth/session/new").
      should route_to("twitter_auth/sessions#new") }
    it { get("twitter_auth/twitter/callback").
      should route_to("twitter_auth/sessions#create") }
  end
end