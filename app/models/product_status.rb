class ProductStatus < ApplicationRecord
  belongs_to :order_item
end
