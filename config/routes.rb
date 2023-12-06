Rails.application.routes.draw do
  # config/routes.rb
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
  resources :experiences do
    resources :appointments, only: [:new, :create]
  end
  resources :appointments, except: [:new, :create] do
    resources :payments, only: :new
  end

  resources :users, only: [:edit, :update]

  # resources :experiences
  # resources :appointments
end
