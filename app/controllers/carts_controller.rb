class CartsController < ApplicationController
  # before_action :find_product

  def index
  @cart = Cart.where(user_id:current_user.id)
  @cartitems = Cartdataitem.where(cart_id:@cart)
  end
  
end
