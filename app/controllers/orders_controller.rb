class OrdersController < ApplicationController
  def index
    order = Order.where(user_id: current_user.id)
    @orders = OrderItem.where(order_id:order)
  end
end
