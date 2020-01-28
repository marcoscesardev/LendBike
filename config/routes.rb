Rails.application.routes.draw do
  resources :bikes
  resources :stations
  resources :lends
  
  devise_for :users, :controllers => { :sessions => "sessions" }
  
  root to: 'home#index'
end
