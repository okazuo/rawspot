Rails.application.routes.draw do
  devise_for :users
  root to: 'spots#index'
  resources :spots do
    resources :order , only: [:index, :create]
    collection do
      get 'search'
    end
  end
end
