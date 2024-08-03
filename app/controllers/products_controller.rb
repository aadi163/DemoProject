class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save    
      redirect_to sellerproductlist_path
    else
      render :new
    end
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :price, :category , :description, :quantity)
  end
end
