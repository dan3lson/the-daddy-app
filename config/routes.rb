# frozen_string_literal: true

Rails.application.routes.draw do
  resources :waitlist_users
  get "/about" => "pages#about"
  get "/contact" => "pages#contact_us", :as => "contact_us"

  # Sessions
  #
  resources :passwords, controller: "clearance/passwords", only: %i[create new]
  resource :session, controller: "clearance/sessions", only: [:create]
  delete "/sign_out" => "clearance/sessions#destroy", :as => "sign_out"

  # Users
  #
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

    # Static Pages
    #
    # TODO: move into its own controller so PagesController isn't mixed with
    # signed-in and signed-out actions
    #
    get "/community-guidelines" => "pages#community_guidelines"
    get "/onboarding" => "pages#onboarding"
    get "/rewards" => "pages#rewards"
    get "/support" => "pages#support"
    get "/faq" => "pages#faq"

    # Onboarding
    #
    resource :onboarding, only: [] do
      resources :invites, only: %i[create], controller: "onboarding/invites"
      resources :comments, only: %i[create], controller: "onboarding/comments"
    end

    # Invites
    #
    resources :invites, only: %i[new create]

    # Feedbacks
    #
    resources :feedbacks, only: %i[index create]

    # Comments
    #
    resources :comments, only: %i[index create] do
      resources :replies, only: %i[index create]
      resource :flags, only: %i[create destroy]
    end
    resource :question_of_the_day, only: %i[show], controller: :question_of_the_day

    # Reactions
    #
    resources :reactions, only: %i[create destroy]

    # Admin
    #
    namespace :admin do
      resources :children
      resources :comments
      resources :emojis
      resources :flags
      resources :invites
      resources :question_of_the_days
      resources :reactions
      resources :topics
      resources :users
      resources :waitlist_users

      root to: "comments#index"

      # Job Scheduler
      #
      require "sidekiq/web"
      require "sidekiq-scheduler/web"
      mount Sidekiq::Web => "/sidekiq"
    end
  end
end
