Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#logout'
  post   '/logout',  to: 'sessions#destroy'
  resources :users
  resources :sessions, only: [:new, :create, :destroy] do
    member do
      get 'logout'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
