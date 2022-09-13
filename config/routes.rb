# frozen_string_literal: true

Rails.application.routes.draw do
  # TODO: restrict access to create when signed out and everything when
  # signed in.
  resources :waitlist_users
  constraints Clearance::Constraints::SignedOut.new do
    root to: 'pages#homepage'
    get 'join', to: "pages#join"
    # TODO: temporarily comment out so no one can create an account. When it's
    # time to launch, create a special sign-up page which pre-fills the email
    # field in the registration form and maybe add a custom "we've been waiting
    # for you" message, :).
    get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
    get '/sign_up' => 'registrations#new', as: 'sign_up'
    resources :registrations, only: %i[new create]
  end

  # Authenticated Views
  constraints Clearance::Constraints::SignedIn.new do
    # Comments
    root to: 'comments#index', as: :signed_in_root
    resources :comments, only: %i[index create] do
      resources :replies, only: %i[index create]
    end
  end

  # Sessions
  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, controller: 'clearance/sessions', only: [:create]
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'

  # Users
  resources :users, only: [] do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[create edit update]
  end

  # Invites
  resources :invites, only: %i[new create]

  # Static Pages
  get '/about' => 'pages#about'

  # Job Scheduler
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'
end
