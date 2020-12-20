Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  
  #controller :sessions do
  #  get 'login' => :new
  #  post 'login' => :create
  #  delete 'logout' => :destroy
  #end
  devise_for :user
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
