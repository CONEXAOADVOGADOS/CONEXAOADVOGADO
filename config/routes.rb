Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
  resources :experiences do
    resources :appointments, only: [:new, :create]
  end
  resources :appointments, except: [:new, :create]

  resources :users, only: [:show, :edit, :update]

  # resources :experiences
  # resources :appointments

end
