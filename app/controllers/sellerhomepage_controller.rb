class SellerhomepageController < ApplicationController
  def index
  end

  def productlist
    @products = Product.all
  end
end
