class CartdataitemsController < ApplicationController
  before_action :authenticate_user! 
  
  def total_amount(total_amount)
    total_amount
  end

  def add_to_cart
    cart = current_user.cart || current_user.create_cart
    product = Product.find(params[:id])
    cartitem = cart.cartdataitems.find_or_initialize_by(product: product)
    if cartitem.save
      redirect_to carts_path
    end
  end

  def destroy
    cartitem = Cartdataitem.find(params[:id])
    if cartitem.destroy
      redirect_to carts_path
    end
  end
end
