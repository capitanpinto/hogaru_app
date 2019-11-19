Rails.application.routes.draw do
  devise_for :maids
  devise_for :admins
  devise_for :users
  get 'basicpages/home'
  get 'basicpages/help'
  get '/search' => 'orders#search', :as => 'search_page'
  root 'services#home'
  resources :users,         only: [:create, :destroy, :index, :show]
  resources :maids,         only: [:create, :destroy, :index, :show]
  resources :admins
  resources :services,         only: [:create, :destroy, :index]
  resources :orders,         only: [:create, :destroy, :index, :show, :update]
  resources :addresses,      only: [:create, :destroy, :index]
end

