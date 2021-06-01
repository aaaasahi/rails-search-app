Rails.application.routes.draw do
  root to: 'posts#index'
  get 'search', to: 'posts#search'
  resources :posts
end
