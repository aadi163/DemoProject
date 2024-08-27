class OrderItemsController < ApplicationController
  before_action :require_login , only: [:orderitem]
  
  def finalorder
    if params[:product_id].present? 
      @product = Product.find(params[:product_id])
    elsif params[:id].present?  
      @product = Product.find(params[:id])
    else
      cart = Cart.where(user_id: current_user.id)
      @cart_items = Cartdataitem.where(cart_id: cart)
    end
    @useraddresses = Useraddress.all
  end

  def orderitem
    order = current_user.order || current_user.create_order
    address = Useraddress.find(params[:address_id])
    if params[:product_id].present?
      @product = Product.find(params[:product_id])
      orderitem = order.order_items.new(product: @product , useraddress: address)
    else
      cart = Cart.where(user_id: current_user.id)
      cart_items = Cartdataitem.where(cart_id: cart)
      cart_items.each do |itm|
        product = itm.product
        orderitem = order.order_items.new(product: product , useraddress: address)
        orderitem.save!
      end
    end

    if orderitem.save!
      redirect_to orders_path
    else
      redirect_to product_path
    end
  end

  def destroy 
    orderitem = OrderItem.find(params[:id])
    if orderitem.destroy
      redirect_to orders_path
    end
  end  

  private
  
  def require_login
    if !user_signed_in?
      redirect_to new_user_registration_path

      if user_signed_in?
        redirect_to finalorder_path
      end
    end
  end
end
