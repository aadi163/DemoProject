class OrderItemsController < ApplicationController

  def finalorder
    @product = Product.find(params[:id])
    @useraddresses = Useraddress.all
  end


  def orderitem
    order = current_user.order || current_user.create_order
    address = Useraddress.find(params[:address_id])
    product = Product.find(params[:product_id])
    @orderitem = order.order_items.new(product: product , useraddress: address)
    
    if @orderitem.save!
      redirect_to orders_path
    else
      redirect_to product_path
    end
  end

  def destroy 
    @order = OrderItem.find(params[:id])
    if @order.destroy
      redirect_to orders_path
    end
  end  

  private

  
end
