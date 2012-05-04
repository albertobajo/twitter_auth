Dummy::Application.routes.draw do

  resource :no_user, only: [:show]
  resource :user, only: [:show]
  root to: "site#index"

end
