require 'sidekiq/web'

Rails.application.routes.draw do
  resources :passengers
  resources :bookings
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
authenticate :user, lambda { |u| u.admin? } do
  mount Sidekiq::Web => '/sidekiq'

  namespace :madmin do
    namespace :active_storage do
      resources :variant_records
    end
    namespace :active_storage do
      resources :attachments
    end
    namespace :active_storage do
      resources :blobs
    end
    resources :users
    resources :services
    resources :notifications
    resources :announcements
    root to: "dashboard#show"
  end
end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  # resources :bookings
  # resources :passengers
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # resources :flights, only: [:index]
  root to: 'flights#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
