Rails.application.routes.draw do
  get 'basicpages/home'
  get 'basicpages/help'
  get 'orders/index'
  root 'services#home'
  devise_for :users
  resources :users
  resource :services,         only: [:create, :destroy]
  resource :orders,         only: [:create, :destroy]
end
