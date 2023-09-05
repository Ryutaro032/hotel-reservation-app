Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "rooms#index"
  get 'rooms/home'
  get 'rooms/search'
  
  resources :users
  resources :rooms
  resources :reservations

  resources :rooms do
    resources :reservations
  end 

  post 'reservations/confirm' 
  post 'reservations/room_back'

end
