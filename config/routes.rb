Rails.application.routes.draw do
  devise_for :users #, :controllers => { :registrations => "registrations" }
  root to: 'pages#home'

  resources :events, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:create, :new]
    resources :reviews, only: [:create, :show, :new]
  end
    resources :bookings, only: [:destroy]

  get "users/:id", to: "users#show", as: :user

  get "/dashboard", to: "pages#dashboard"

  resources :chatrooms, only: :show do
    resources :messages, only: :create
 end
end
