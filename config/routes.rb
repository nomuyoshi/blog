Rails.application.routes.draw do
  resources :articles, only: [:index, :show]
  namespace :admin do
    resources :articles
    resources :media, only: [:index, :new, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
