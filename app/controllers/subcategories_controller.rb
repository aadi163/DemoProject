class SubcategoriesController < ApplicationController
  def new
    # @category = Category.find(params[:id])
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
    @subcategory = Subcategory.find(params[:id])
  end

  def update
    @subcategory = Subcategory.find(params[:id])
    if @subcategory.update(subcategory_params)
      redirect_to categorylist_path
    else
      render :edit
    end
  end

  def destroy
    @subcategory = Subcategory.find(params[:id])
    if @subcategory.destroy
      redirect_to categorylist_path
    end
  end

  private

  def subcategory_params
    params.require(:subcategory).permit(:name ,:category_id)
  end
end
