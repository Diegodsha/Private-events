Rails.application.routes.draw do
  resources :events
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  root 'events#index'
  resources :users
end
