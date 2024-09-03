class SellerHomepageController < ApplicationController
  # before_action :authenticate_user! 

  def product_list
    @products = Product.where(user_id: current_user)
  end

  def seller_orders
    @order_items = OrderItem.all
  end
end
