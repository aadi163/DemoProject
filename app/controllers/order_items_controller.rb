class OrderItemsController < ApplicationController
  before_action :require_login , only: [:add_to_order]
  
  def final_order
    if params[:product_id].present? 
      @product = Product.find(params[:product_id])
    elsif WishlistItem.find_by(product_id: params[:id]).present?  
      @product = Product.find(params[:id])
    else
      cart = Cart.where(user_id: current_user.id)
      @cart_items = Cartdataitem.where(cart_id: cart)
    end
    @useraddresses = Useraddress.all
  end

  def add_to_order
    order = current_user.order || current_user.create_order
    address = Useraddress.find(params[:address_id])
    if params[:product_id].present?
      @product = Product.find(params[:product_id])
      order_item = order.order_items.new(product: @product , useraddress: address)
    else
      cart = Cart.where(user_id: current_user.id)
      cart_items = Cartdataitem.where(cart_id: cart)
      cart_items.each do |itm|
        product = itm.product
        order_item = order.order_items.new(product: product , useraddress: address)
        order_item.save!
      end
    end

    if order_item.save!
      redirect_to orders_path
      OrderItemMailer.with(user: current_user , order_item: order_item).order_item_email.deliver_later
    else
      redirect_to product_path
    end
  end

  def destroy 
    order_item = OrderItem.find(params[:id])
    if order_item.destroy!
      redirect_to orders_path
    end
  end  

  private
  
  def require_login
    if !user_signed_in?
      redirect_to new_user_registration_path

      if user_signed_in?
        redirect_to final_order_path
      end
    end
  end
end
