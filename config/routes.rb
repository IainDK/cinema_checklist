Rails.application.routes.draw do
  root 'movies#index'
  devise_for :users

  resources :users, :only => [:show]
  resources :movies
end
