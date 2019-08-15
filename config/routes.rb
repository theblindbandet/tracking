# frozen_string_literal: true

Rails.application.routes.draw do
  resources :trainings
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  get    "/logout",  to: "sessions#logout"
  post   "/logout",  to: "sessions#destroy"
  resources :users
  resources :sessions, only: %i(new create destroy) do
    member do
      get "logout"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
