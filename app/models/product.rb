class Product < ApplicationRecord
  has_one_attached :product_image
  belongs_to :subcategory
  
  has_many :cartdataitems
  has_many :carts , :through => :cartdataitems

  has_many :order_items
  has_many :orders , :through => :order_items
end
