Rails.application.routes.draw do

  root to: "authors#index"

  resources :authors
  resources :books
  resources :publishers
  resources :users, only:[:new, :create, :show]
end
