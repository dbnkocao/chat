Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  devise_for :users, :controllers => { registrations: "registration" }

  resources :teams, except: [:show]
  get "/teams/:slug", to: "teams#show"

  resources :team_users, only: [:create, :index, :show]
  delete "/team_user/:id/:team_id", to: "team_users#destroy"

  resources :channels, only: [:create, :show, :destroy]
  # resources :talks, only: [:show]
  get "talks/:id/:team_id", to: "talks#show", as: :talk
  root to: "teams#index"

  resources :messages, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
