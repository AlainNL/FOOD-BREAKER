Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :events do
    resources :bookings, only: [:create, :update]
    resources :reviews, only: :create
  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
    # get "/chatroom", to: "events#chatroom", as: :chatroom
  end
  resources :bookings, only: [:destroy]
  # resources :networks, except: [:new, :index]
  get "/dashboard", to: "dashboards#dashboard", as: :dashboard
end
