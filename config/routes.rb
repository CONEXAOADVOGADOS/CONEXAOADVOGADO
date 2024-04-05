Rails.application.routes.draw do
  # config/routes.rb
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  devise_for :users
  root to: "pages#home"
  get "sobre", to:"about#sobre"
  get "adv", to:"about#adv"

  get "up" => "rails/health#show", as: :rails_health_check
  resources :lawyers do
    resources :connections, only: [:new, :create]
  end

  resources :connections, except: [:new, :create] do
    resources :payments, only: :new
  end

  resources :users, only: [:edit, :update]

  # resources :lawyers
  # resources :connections
end
