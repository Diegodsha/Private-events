Rails.application.routes.draw do
  resources :events
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  root 'users#index'
  resources :users
end
