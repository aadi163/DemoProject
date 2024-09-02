Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  #userhome routes
  root to:'homepage#index'
  get 'homepage', to: "homepage#index" , as: 'homepage'
  get '/homepage/:id/filter_products' , to: 'homepage#filter_products' , as: 'filter_products'

  #sellerhome routes
  get 'sellerhome', to: "sellerhomepage#index" , as: 'sellerhome'
  get 'seller_product_list' => "sellerhomepage#product_list"

  #adminhome routes
  get 'adminhome' => "adminhomepage#index"
  
  #category routes
  get 'categorylist' => "categories#categorylist"

  #carts routes
  post '/cartdataitems/:id/add_to_cart/', to: 'cartdataitems#add_to_cart', as: 'add_to_cart'
  get 'cartindex' => "carts#index"

  #address routes
  post 'create_address' => "useraddresses#create_address"

  #order routes
  get  '/order_items/:id/final_order' , to: 'order_items#final_order' , as: 'final_order'
  get  '/order_items/:id/selectaddress' , to: 'order_items#selectaddress' , as: 'selectaddress'
  post '/order_items/:id/add_to_order' , to: 'order_items#add_to_order' , as: 'add_to_order'

  #wishlist routes
  post '/wishlist_items/:id/add_to_wishlist' , to: 'wishlist_items#add_to_wishlist' , as: 'add_to_wishlist'

  
  resources :categories
  resources :subcategories
  resources :products 
  resources :carts
  resources :useraddresses
  resources :cartdataitems 
  resources :order_items
  resources :orders
  resources :wishlist_items
  resources :wishlists

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

