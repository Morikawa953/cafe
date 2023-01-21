Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users
  resources :users, only: [:show] 
  resources :shops do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :relationships, only: [:create, :destroy]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
  root "shops#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
