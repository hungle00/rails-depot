Rails.application.routes.draw do
  devise_for :user

  namespace :admin do
    root "orders#index"
    get 'orders/export'
    resources :users do
      get 'export', on: :collection
    end
  end

  resources :orders, except: [:index]
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  resources :products do
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
