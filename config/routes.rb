Rails.application.routes.draw do
  namespace :twitter_auth do
    resource :session, only: [:new, :destroy]
    match "twitter/callback" => "sessions#create", as: "callback"
  end
end
