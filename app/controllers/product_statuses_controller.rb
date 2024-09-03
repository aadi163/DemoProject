class ProductStatusesController < ApplicationController
  def set_product_status
    status = ProductStatus.new(product_status_params)
    status.save
  end

  private

  def product_status_params
    params.permit(:product_id , :status)
  end
end
