class CartdataitemsController < ApplicationController
  before_action :require_login , only: [:addtocart]
  
  def total_amount(total_amount)
    return total_amount
  end

  def addtocart
    cart = current_user.cart || current_user.create_cart
    product = Product.find(params[:id])
    cartitem = cart.cartdataitems.find_or_initialize_by(product: product)
    
    if cartitem.save
      redirect_to carts_path
    else
      redirect_to product_path
    end
  end

  def destroy
    cartitem = Cartdataitem.find(params[:id])
    if cartitem.destroy
      redirect_to carts_path
    end
  end

  private
    def require_login
      if !user_signed_in?
        redirect_to new_user_registration_path 
      end
    end

end
