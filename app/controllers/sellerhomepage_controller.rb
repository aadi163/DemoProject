class SellerhomepageController < ApplicationController
  def product_list
    @products = Product.all
  end
end
