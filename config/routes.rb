Rails.application.routes.draw do

  use_doorkeeper
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :sellers ,path: 'sellers'
  devise_for :buyers , path: 'buyers'

  resources :type_of_payments
  resources :categories
  resources :pincodes
  resources :seller_addresses
  resources :buyer_addresses
  resources :products
  resources :order_items
  resources :orders

  
  namespace :api, defaults: { format: 'json' } do
  namespace :v1 do
    resources :buyers 
  end
  end
  
  root 'home_page#home'
  get '/home_page/index', to: 'home_page#index'
  get 'search' , to: 'home_page#search'
  get 'order_address', to: 'orders#address_selected'
  post 'order_address', to: 'orders#address_selec'
  get 'order_confirmation' , to: 'orders#order_confirmation'
  get 'sellers.:id' , to: 'sellers#seller_console'
  get '/sellers' ,to: 'sellers#index'
  get 'sellers/order', to: 'orders#index'
  get 'buyers/order' ,to: 'orders#index1'
  delete 'buyers/order' ,to: 'orders#destroy'
  put 'sellers/order', to: 'orders#confirm'
  get 'sellers/:id/products' , to: 'products#export'
  resources :buyers 
end
