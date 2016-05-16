Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :my_articles, only: [:index]
  resources :statics, only: [:index]
  devise_for :users

  root 'articles#index'
end
