Rails.application.routes.draw do
  resources :bikes
  resources :stations
  
  devise_for :users, :controllers => { :sessions => "sessions" }
  
  root to: 'home#index'
end
