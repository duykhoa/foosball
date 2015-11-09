Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :users
  resources :teams
  resources :games
  resources :matches
end
