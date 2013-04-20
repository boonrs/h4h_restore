H4hRestore::Application.routes.draw do
  devise_for :users

  resources :donations

  root to: "donations#index"
end
