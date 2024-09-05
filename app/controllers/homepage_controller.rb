class HomepageController < ApplicationController
  before_action :all_category

  def index
    @products = Product.all
  end

  def filter_products
    subcategory = Subcategory.find(params[:id])
    @categoryProducts = subcategory.products.all
  end 

  def search_products
    if subcategory = Subcategory.find_by(name: params[:name]).present?
      subcategory = Subcategory.find_by(name: params[:name])
      @categoryProducts = subcategory.products.all
    else
      redirect_to homepage_path
    end
  end

  private

  def all_category
    @categories = Category.all
  end
end
