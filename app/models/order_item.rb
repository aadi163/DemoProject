class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :useraddress
  has_one :product_status , dependent: :destroy
end
