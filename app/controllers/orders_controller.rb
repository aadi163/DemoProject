class OrdersController < ApplicationController
  before_action :authenticate_user! 

  def index
    orders = Order.where(user_id: current_user.id)
    @orders = OrderItem.where(order_id: orders.ids)
  end
end
