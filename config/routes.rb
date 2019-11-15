Rails.application.routes.draw do
  get 'basicpages/home'
  get 'basicpages/help'
  root 'services#home'
  devise_for :users
  resources :users
  resources :services,         only: [:create, :destroy, :index]
  resources :orders,         only: [:create, :destroy, :index]
end
