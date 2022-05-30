Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  resources :orders

  # resources :line_items
  # resource :carts, only:[:show]
  resources :brands
  resources :types
  devise_for :users
  resources :products
  get 'home/index'
  get 'home/faq'
  get 'home/help'
  get 'home/about'
  get 'home/dashboard'
  root 'home#index'

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  post 'orders/:id/confirm' => "orders#toggle_confirm", as: "toggle_confirm"



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
