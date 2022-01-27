Rails.application.routes.draw do
  resources :posts
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:index, :show]

  resources :friend_requests, only: [:create, :index, :destroy]

  resources :friendships, only: [:create, :index]

  resources :comments

  resources :likes, only: [:create, :destroy, :index]

  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
