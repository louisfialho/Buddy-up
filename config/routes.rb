Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :events, only: [:show, :index ] do
    resources :bookings, only: [:create]
  end
end
