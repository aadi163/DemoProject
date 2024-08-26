class OrderItemsController < ApplicationController
  before_action :require_login , only: [:orderitem]
  before_action :find_product , only: [:finalorder , :orderitem ]
  
  def finalorder
    @useraddresses = Useraddress.all
  end

  def orderitem
    order = current_user.order || current_user.create_order
    address = Useraddress.find(params[:address_id])
    orderitem = order.order_items.new(product: @product , useraddress: address)
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

  def find_product
    @product = Product.find(params[:id])
  end

end
