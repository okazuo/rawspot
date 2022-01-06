Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  resources :spots do
    collection do
      get "search"
    end
    resources :orders, only: [:index, :create] do
    end
    resources :closes, only: [:index, :create] do
    end
  end
end
