Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get '/followers', to: 'followers#index', as: :followers
  get '/following', to: 'followings#index', as: :following
  get '/starred', to: 'starred#index', as: :starred
  get '/recent_activities', to: 'recent_activities#index', as: :recent_activities
  get '/organizations', to: 'organizations#index', as: :organizations
  get '/repos', to: 'repos#index', as: :repos
end
