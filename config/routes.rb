H4hRestore::Application.routes.draw do
  devise_for :users

  resources :donations

  resources :reports

  root to: "home#index"
end
