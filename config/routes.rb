Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :tools do
    resources :bookings, only: [:new, :create]
  end

  resources :tools, only: [:destroy]
  resources :bookings, only: [:show, :index]
  resources :users, only: [:show, :index]
end
