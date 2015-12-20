Rails.application.routes.draw do

  root to: "catalogs#index"

  namespace :admin do
    get 'base/index'
    resources :authors
    resources :books, except: [:new]
    resources :publishers, except: [:new]
  end
  
  get '/signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: 'signout'

  get '/add_publisher', to: 'admin/publishers#new', as: 'add_publisher'
  get '/add_book', to: 'admin/books#new', as: 'add_book'
  get 'reset/password', to: 'password_resets#new'
  
  
  resources :books, only: [:show]
  resources :users, only:[:index, :show, :new, :create]
  resource :session, only: [:destroy]
  resources :carts, only: [:show, :destroy]
  resources :cart_items, only: [:create]
  resources :orders, only: [:new, :create]
  resources :password_resets, only: [:create]

  resources :catalogs, only: [:index, :show] do
    collection do
      post :search, to: 'catalogs#search'
    end
  end

  
end
