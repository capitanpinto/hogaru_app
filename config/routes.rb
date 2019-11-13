Rails.application.routes.draw do
  get 'basicpages/home'
  get 'basicpages/help'
  root 'services#home'
  devise_for :users
  resources :users
  resource :services
end
