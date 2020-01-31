Rails.application.routes.draw do
  resources :bikes, except: [:destroy]
  resources :stations, except: [:destroy]
  resources :lends, except: [:destroy]

  scope "/admin" do
    resources :users, except: [:destroy]
  end

  resources :bills, only: [:index, :show, :new] do
    post :generate, on: :collection
  end

  devise_for :users, :controllers => { :sessions => "sessions" }

  namespace :api do
    namespace :v1 do
      post 'auth/token', to: 'authentications#authenticate_user'
      post 'lends/get_bike', to: 'lends#get_bike'
      post 'lends/leave_bike', to: 'lends#leave_bike'
      get 'bills/:year/:month', to: 'bills#generate'

      jsonapi_resources :bikes, only: [:index, :show]
      jsonapi_resources :stations, only: [:index, :show]
    end
  end

  # API SMART DOCUMENTATION
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: 'home#index'
end
