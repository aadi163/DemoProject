class CartsController < ApplicationController
  before_action :authenticate_user! 

  def index
    carts = Cart.where(user_id: current_user.id)
    @cartitems = Cartdataitem.where(cart_id: carts.ids)
  end 
end
