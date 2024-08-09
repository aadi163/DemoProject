class CartItemsController < ApplicationController
  def addtocart
    @cart = current_user.cart || current_user.create_cart
    @product = Product.find(params[:id])
    @cartitem = @cart.cart_items.new(product_id: @product)
    #@cartitem = Cartdataitem.create(cart_id:@cart , product_id:@product)

    if @cartitem.save
      redirect_to carts_path
    else
      redirect_to product_path
    end
  end
end
