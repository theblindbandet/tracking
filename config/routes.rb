# frozen_string_literal: true

Rails.application.routes.draw do
  resources :trainings
<<<<<<< HEAD
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  get    "/logout",  to: "sessions#logout"
  post   "/logout",  to: "sessions#destroy"
=======
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#logout'
  post   '/logout',  to: 'sessions#destroy'
>>>>>>> add training model
  resources :users
  resources :sessions, only: %i(new create destroy) do
    member do
      get "logout"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
