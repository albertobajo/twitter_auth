Dummy::Application.routes.draw do

  resource :user, only: [:show]
  root to: "site#index"

end
