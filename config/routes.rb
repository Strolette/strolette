Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'reservations'
    end
  end

  resources :items do
    resources :bookings, only: [:create, :index]
  end

end
