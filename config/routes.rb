Rails.application.routes.draw do

  root 'top#index'

  devise_for :users
  resources :rooms
  resources:bookings

  resources :bookings do
    member do
      post 'confirm'
    end

    member do
      post 'complete'
    end
  end   


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

 resources :users do
  member do
    get 'account'
  end

  member do
    get 'profile'
  end
end

resources :rooms do
  member do
    get 'posts'
  end
 end
end



