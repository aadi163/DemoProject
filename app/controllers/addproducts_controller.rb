class AddproductsController < ApplicationController
  def new
    @prod = Product.new
  end

  def create
    byebug
    @prod = Product.new(product_params)
    if @prod.save    
      redirect_to sellerproductlist_path
    else
      render :new
    end
  end
  
  private
  
  def product_params
    params.require(:prod).permit(:name, :price, :category , :description, :quantity)
  end
end
