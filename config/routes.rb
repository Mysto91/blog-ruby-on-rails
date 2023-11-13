Rails.application.routes.draw do
  root 'articles#index'

  namespace :api do
    resources :articles
    resources :authors
  end

  resources :articles do
    resources :comments
  end

  get "api/current-date", to: "api/info#index"
end
