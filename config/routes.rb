H4hRestore::Application.routes.draw do
  resources :donors
  resources :donations do
    resources :line_items
  end
  resources :reports

  devise_for :users

  root to: "home#index"
end
