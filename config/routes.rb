Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update]


  resources :items
  resources :bookings
end
