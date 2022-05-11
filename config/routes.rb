Rails.application.routes.draw do

  get 'bookings/index'
  get 'sessions/new'
  devise_for :users
  root 'top#index'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  post 'booking/confirm' 
  post 'booking/back' 
  post 'booking/complete' 

  resource :user
  resources :rooms
  resources:bookings
end
