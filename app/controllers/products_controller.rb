class ProductsController < ApplicationController
  before_action :find_product , only: [:show , :edit , :update , :destroy]

  def new
    @product = Product.new
  end

  def show
    # @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save    
      redirect_to sellerproductlist_path
    else
      render :new
    end
  end
  
  def edit
    # @product = Product.find(params[:id])
  end

  def update
    # @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to sellerproductlist_path
    else
      render :new
    end
  end

  def destroy
    if @product.destroy
      redirect_to sellerproductlist_path
    end
  end

  private
  
  def product_params
    params.require(:product).permit(:name, :price, :subcategory_id , :description, :quantity ,:product_image)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
