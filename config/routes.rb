Rails.application.routes.draw do

  root to: "catalogs#index"

  get '/signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: 'signout'

  resources :authors
  resources :books
  resources :publishers
  resources :users, only:[:index, :show, :new, :create]
  resource :session

end
