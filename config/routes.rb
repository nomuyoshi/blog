Rails.application.routes.draw do
#  resources :articles, param: :slug, only: [:index, :show]
  get "/:slug", to: "articles#show", as: :article
  root to: "articles#index"

  resources :categories, param: :slug, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :articles
    resources :media, only: [:index, :new, :create, :destroy]
  end
end
