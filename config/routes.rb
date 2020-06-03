Rails.application.routes.draw do
  devise_for :users, :controllers => { registration: "registration" }
  resources :teams, except: [:show]
  get "/teams/:slug", to: "teams#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
