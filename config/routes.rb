# frozen_string_literal: true

Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedOut.new do
    root to: 'pages#homepage'
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

  # Static Pages
  get '/about' => 'pages#about'
end
