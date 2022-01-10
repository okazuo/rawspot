Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  resources :spots do
    collection do
      get "search"
    end
    resources :orders, only: [:index, :create]
    resources :closes, only: [:index, :create]
    resources :comments , only: :create
  end
end
