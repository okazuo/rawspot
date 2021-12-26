Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  root to: 'spots#index'
  resources :spots do
    collection do
      get 'search'
    end
  end
end
