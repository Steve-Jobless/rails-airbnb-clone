Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :spaces, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:create]
  end
  resources :bookings

  get "/dashboard", to: "users#dashboard", as: :dashboard
  get "/search", to: 'spaces#index'

end
