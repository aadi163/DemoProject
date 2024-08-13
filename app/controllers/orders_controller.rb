class OrdersController < ApplicationController
  def index
    @orders = OrderItem.all
  end
end
