Rails.application.routes.draw do
  resources :bikes
  resources :stations
  resources :lends

  devise_for :users, :controllers => { :sessions => "sessions" }

  namespace :api do
    namespace :v1 do
      post 'auth/token', to: 'authentications#authenticate_user'

      jsonapi_resources :bikes, only: [:index, :show]
      jsonapi_resources :stations, only: [:index, :show]
    end
  end

  root to: 'home#index'
end
