# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#homepage'

  # == Authenticated Views
  #
  constraints Clearance::Constraints::SignedIn.new do
    resources :conversations, only: %i[index]
    resources :replies, only: [:show]
  end
  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :users, only: [:create] do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[create edit update]
  end

  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'clearance/users#new', as: 'sign_up'

  # == Static Pages
  #
  get '/about' => 'pages#about'
end
