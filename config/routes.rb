Rails.application.routes.draw do
  root 'items#index'

  namespace :api do
    namespace :v1 do
      resources :items
    end
  end

  get '/search', to: "search#index"
  resources :orders, only: [:index, :show]
  resources :users, only: [:index, :show]
end
