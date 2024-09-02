class CartsController < ApplicationController
  before_action :authenticate_user! 

  def index
  cart = Cart.where(user_id: current_user.id)
  @cartitems = Cartdataitem.where(cart_id: cart)
  end 
end
