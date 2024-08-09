class OrderItemsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @useraddresses = Useraddress.all
  end
end
