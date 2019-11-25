# frozen_string_literal: true

Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedOut.new do
    root to: 'pages#homepage'
    get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
    get '/sign_up' => 'clearance/users#new', as: 'sign_up'
  end

  # == Authenticated Views
  #
  constraints Clearance::Constraints::SignedIn.new do
    # Comments
    root to: 'conversations#index', as: :signed_in_root
    resources :conversations, only: %i[index]
    resources :replies, only: [:show]
  end

  # Sessions
  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  # Users
  resources :users, only: %i[new create] do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[create edit update]
  end

  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'

  # == Static Pages
  #
  get '/about' => 'pages#about'
end
