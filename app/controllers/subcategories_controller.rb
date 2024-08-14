class SubcategoriesController < ApplicationController
  before_action :find_id , only: [:edit , :update , :destroy]
  
  def new
    @subcategory = Subcategory.new(params[:category_id])
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      redirect_to categorylist_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @subcategory.update(subcategory_params)
      redirect_to categorylist_path
    else
      render :edit
    end
  end

  def destroy
    if @subcategory.destroy
      redirect_to categorylist_path
    end
  end

  private

  def subcategory_params
    params.require(:subcategory).permit(:name ,:category_id)
  end

  def find_id
    @subcategory = Subcategory.find(params[:id])
  end
end
