Rails.application.routes.draw do

  root to: "catalogs#index"

  resources :authors
  resources :books
  resources :publishers
  resources :users, only:[:index, :new, :create, :show]

end
