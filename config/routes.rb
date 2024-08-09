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
  #get 'addtocart' => "carts#addtocart"
  post '/cartdataitems/:id/addtocart/', to: 'cartdataitems#addtocart', as: 'addtocart'
  get 'cartindex' => "carts#index"
  get 'orderitem' => "order_items#show"

  # post 'cartcreate' => "carts#create"

  resources :categories
  resources :subcategories
  resources :products 
  resources :carts
  resources :useraddresses
  resources :cartdataitems , only:[:cartdataitems]
  resources :order_items
  





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

