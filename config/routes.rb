Rails.application.routes.draw do
  devise_for :users, :controllers => { registration: "registration" }
  resources :teams, except: [:show]
  get "/teams/:slug", to: "teams#show"
  resources :team_users, only: [:create, :index, :show]
  delete "/team_user/:id/:team_id", to: "team_users#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
