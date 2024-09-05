class ProductStatusesController < ApplicationController
  def set_product_status
    status = ProductStatus.find_by(order_item_id: params[:id])
    status.update(product_status_params)
  end

  private

  def product_status_params
    params.permit(:status)
  end
end
