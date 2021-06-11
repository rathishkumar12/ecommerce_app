Rails.application.routes.draw do
  resources :pincodes
  resources :seller_addresses
  resources :buyer_addresses
  resources :products
  resources :order_items
  resources :orders
  resources :sellers
  resources :buyers
  root 'home_page#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
