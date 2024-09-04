class OrderItemsController < ApplicationController
  before_action :authenticate_user! 
  
  def final_order
    if params[:product_id].present? 
      @product = Product.find(params[:product_id])
    elsif WishlistItem.find_by(product_id: params[:id]).present?  
      @product = Product.find(params[:id])
    else
      cart = Cart.where(user_id: current_user.id)
      @cart_items = Cartdataitem.where(cart_id: cart)
    end
    @useraddresses = Useraddress.where(user_id: current_user.id)
  end

  def add_to_order
    order = current_user.order || current_user.create_order
    address = Useraddress.find(params[:address_id])
    if params[:product_id].present?
      @product = Product.find(params[:product_id])
      order_item = order.order_items.new(product: @product , useraddress: address)
      order_item.save
      ProductStatus.create(order_item_id: order_item.id, status: "pending")
    else
      cart = Cart.where(user_id: current_user.id)
      cart_items = Cartdataitem.where(cart_id: cart)
      @cart_products = Array.new(cart_items.count)
      @i=0
      cart_items.each do |itm|
        product = itm.product
        @cart_products[@i] = product 
        order_item = order.order_items.new(product: product , useraddress: address)
        order_item.save!
        ProductStatus.create(order_item_id: order_item.id, status: "pending")
        @i=@i+1
      end
    end
    if order_item.save!
      OrderItemMailer.order_item_email(current_user , product: @cart_products || @product).deliver_now
      redirect_to orders_path
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
end
