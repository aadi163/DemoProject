class Product < ApplicationRecord
  has_one_attached :product_image
  belongs_to :subcategory
  
  has_many :cartdataitems
  has_many :carts , :through => :cartdataitems
end
