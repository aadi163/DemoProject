class Product < ApplicationRecord
  has_one_attached :product_image
  belongs_to :subcategory
  
  has_many :cartdataitems , dependent: :destroy
  has_many :carts , :through => :cartdataitems

  has_many :order_items , dependent: :destroy
  has_many :orders , :through => :order_items
end
