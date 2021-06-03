Rails.application.routes.draw do
  root to: 'posts#index'
  get 'search', to: 'posts#search'
  get 'tag', to: 'tags#index'
  resources :posts
end
