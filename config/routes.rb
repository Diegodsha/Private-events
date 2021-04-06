Rails.application.routes.draw do
  get 'login', to: 'sessions/new'
  post 'login', to: 'sessions#create'

  root 'users#index'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
