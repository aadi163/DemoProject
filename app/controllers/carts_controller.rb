class CartsController < ApplicationController
  # before_action :find_product

  def index
  @cartitems = Cartdataitem.all
  end
  
end
