Rails.application.routes.draw do
  resources :products
  resources :inventories, only: [:index, :update]
  resources :transactions, only: [:index, :create]
  resources :users, only: [:index, :update, :create, :destroy]
  resources :notifications, only: [:index, :update]
end
