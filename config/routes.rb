Rails.application.routes.draw do

  root to: "catalogs#index"

  namespace :admin do
    get 'base/index'

    resources :authors
    resources :books
    resources :publishers
  end
  
  get '/signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: 'signout'


  resources :users, only:[:index, :show, :new, :create]
  resource :session

end
