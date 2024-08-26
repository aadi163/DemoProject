class SellerhomepageController < ApplicationController
  def productlist
    @products = Product.all
  end
end
