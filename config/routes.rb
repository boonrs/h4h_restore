H4hRestore::Application.routes.draw do
  resources :donors
  resources :donations

  devise_for :users

  root to: "home#index"
end
