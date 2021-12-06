Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :spaces, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:create]
  end
  resources :bookings
  resources :spaces, only: [:edit, :update]
  get "/dashboard", to: "users#dashboard", as: :dashboard
  get "/pending", to: "users#pending", as: :pending
  get "/accepted", to: "users#accepted", as: :accepted
  get "/user_spaces_bookings", to: "users#user_spaces_bookings", as: :user_spaces_bookings
  get "users/spaces", to: "users#spaces", as: :user_space
  get "/search", to: 'spaces#index'
  post "spaces/new", to: 'spaces#new'
  get "spaces/:id/edit", to: 'spaces#edit', as: :space_edit
  patch "spaces/:id/update", to: 'spaces#update', as: :space_update
end
