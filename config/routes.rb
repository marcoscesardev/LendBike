Rails.application.routes.draw do
  resources :bikes
  devise_for :users, :controllers => { :sessions => "sessions" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'home#index'
end
