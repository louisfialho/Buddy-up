Rails.application.routes.draw do
  devise_for :users #, :controllers => { :registrations => "registrations" }
  root to: 'pages#home'

  resources :events, only: [:show, :index ] do
    resources :bookings, only: [:create]
  end

end
