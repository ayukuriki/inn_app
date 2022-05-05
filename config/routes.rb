Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users
  root 'top#index'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resource :user
end
