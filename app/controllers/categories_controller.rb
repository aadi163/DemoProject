class CategoriesController < ApplicationController
  before_action :find_id , only: [:edit , :update , :destroy]

  def categorylist
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save    
      redirect_to categorylist_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @category.update(category_params)
      redirect_to categorylist_path
    else
      render :edit
    end
  end 
  
  def destroy
    if @category.destroy
      redirect_to categorylist_path
    end

  end

  private
  
  def category_params
    params.require(:category).permit(:name)
  end

  def find_id
    @category = Category.find(params[:id])
  end
end
