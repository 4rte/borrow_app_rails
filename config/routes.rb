Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/index'
  get 'reviews/show'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/index'
  get 'bookings/show'
  get 'tools/new'
  get 'tools/create'
  get 'tools/index'
  get 'tools/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
