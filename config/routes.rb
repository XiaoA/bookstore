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

  resources :books, only: [:show]
  resources :users, only:[:index, :show, :new, :create]
  resource :session
  resources :catalogs, only: [:index, :show] do
    collection do
      post :search, to: 'catalogs#search'
    end
  end

end
