Rails.application.routes.draw do
  root 'articles#index'

  #get "/api/articles", to: "articles#getArticles"
  #get "/api/articles/:id", to: "articles#getArticle"

  namespace :api do
    resources :articles
    resources :authors
  end

  resources :articles do
    resources :comments
  end
end
