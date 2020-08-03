Rails.application.routes.draw do
  root to: 'tasks#index'


  get 'signup', to: 'users#new'
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
  resources :users, only: [ :show, :new, :create]
  resources :tasks
  end



