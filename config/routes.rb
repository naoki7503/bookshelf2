Rails.application.routes.draw do
  get 'topic/new'
  root 'static_pages#home'
  get 'sessions/new'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users
  resources :relationships,       only: [:create, :destroy]
  resources :microposts,          only: [:create, :destroy]
end
