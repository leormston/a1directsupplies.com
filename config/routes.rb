Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :products
  resources :carts
  resources :orders
  get 'simple_pages/index'
  root 'simple_pages#index'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/products'
  post 'simple_pages/thank_you'
  get 'products/index' => 'script#index'
  get 'users/show'
  post 'carts/index'
  post 'carts/show'
  post 'carts/checkout'
  get 'orders/show'
  get 'admin/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
