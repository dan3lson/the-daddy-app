# frozen_string_literal: true

Rails.application.routes.draw do
  resources :waitlist_users
  get "/about" => "pages#about"
  get "/contact" => "pages#contact_us", :as => "contact_us"

  # Sessions
  resources :passwords, controller: "clearance/passwords", only: %i[create new]
  resource :session, controller: "clearance/sessions", only: [:create]
  delete "/sign_out" => "clearance/sessions#destroy", :as => "sign_out"

  # Users
  resources :users, only: [] do
    resource :password,
      controller: "clearance/passwords",
      only: %i[create edit update]
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "pages#homepage"
    get "join", to: "pages#join"

    get "/sign_up" => "registrations#new", :as => "sign_up"
    resources :registrations, only: %i[new create]

    get "/sign_in" => "clearance/sessions#new", :as => "sign_in"
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: "comments#index", as: :signed_in_root

    get "/community-guidelines" => "pages#community_guidelines"
    get "/onboarding" => "pages#onboarding"

    resource :onboarding, only: [] do
      resources :invites, only: %i[create], controller: "onboarding/invites"
    end

    # Invites
    resources :invites, only: %i[new create]

    # Comments
    resources :comments, only: %i[index create] do
      resources :replies, only: %i[index create]
    end

    namespace :admin do
      resources :babies
      resources :comments
      resources :invites
      resources :topics
      resources :users
      resources :waitlist_users

      root to: "waitlist_users#index"

      # Job Scheduler
      require "sidekiq/web"
      require "sidekiq-scheduler/web"
      mount Sidekiq::Web => "/sidekiq"
    end
  end
end
