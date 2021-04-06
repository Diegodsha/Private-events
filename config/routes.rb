Rails.application.routes.draw do
  resources :events
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  root 'users#index'
  resources :users
end
