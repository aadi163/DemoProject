class CartdataitemsController < ApplicationController

  def addtocart
    @cart = current_user.cart || current_user.create_cart
    @product = Product.find(params[:id])
    @cartitem = @cart.cartdataitems.find_or_initialize_by(product: @product)
    
    if @cartitem.save
      redirect_to carts_path(@cart)
    else
      redirect_to product_path
    end
  end
end
