Rails.application.routes.draw do

  devise_for :users

  #userhome routes
  root 'homepage#index'
  get 'homepage' => "homepage#index"

  #sellerhome routes
  get 'sellerhome' => "sellerhomepage#index"
  get 'sellerproductlist' => "sellerhomepage#productlist"

  #adminhome routes
  get 'adminhome' => "adminhomepage#index"
  
  #category routes
  get 'categorylist' => "categories#categorylist"

  #carts routes
  post '/cartdataitems/:id/addtocart/', to: 'cartdataitems#addtocart', as: 'addtocart'
  get 'cartindex' => "carts#index"

  #order routes
  get  '/order_items/:id/finalorder' , to: 'order_items#finalorder' , as: 'finalorder'
  get  '/order_items/:id/selectaddress' , to: 'order_items#selectaddress' , as: 'selectaddress'
  post '/order_items/:id/orderitem' , to: 'order_items#orderitem' , as: 'orderitem'

  

  resources :categories
  resources :subcategories
  resources :products 
  resources :carts
  resources :useraddresses
  resources :cartdataitems 
  resources :order_items
  resources :orders
  





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

