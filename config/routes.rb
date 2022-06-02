Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :events do
    resources :bookings, only: [:create, :update]
  end
  resources :bookings, only: [:destroy]
  resources :networks, except: [:new, :index]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  get "/dashboard", to: "dashboards#dashboard", as: :dashboard
end
