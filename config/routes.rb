Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :events, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:create, :index]
  end
    resources :bookings, only: [:destroy]

  get "/dashboard", to: "pages#dashboard"

end

#The user/:id/dashboard should have both the user/user_id/bookings/index + user/user_id/events/index
