class HomepageController < ApplicationController

  def index
    @categories = Category.all
    @products = Product.all
  end

  def filter_products
    @categories = Category.all
    subcategory = Subcategory.find(params[:id])
    @categoryProducts = subcategory.products.all
  end 
end
