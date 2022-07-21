Rails.application.routes.draw do
#  resources :articles, param: :slug, only: [:index, :show]
  get "/:slug", to: "articles#show", as: :article
  root to: "articles#index"

  resources :categories, param: :slug, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    get 'login' => 'user_sessions#new', :as => :login
    post 'login' => "user_sessions#create"
    post 'logout' => 'user_sessions#destroy', :as => :logout
    resources :articles, param: :slug
    resources :media, only: [:index, :new, :create, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end
end
