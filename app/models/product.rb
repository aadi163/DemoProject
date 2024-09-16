class Product < ApplicationRecord
  validates :name, :price , presence: true
  
  has_one_attached :product_image
  belongs_to :subcategory
  belongs_to :user
  
  has_many :cartdataitems , dependent: :destroy
  has_many :carts , :through => :cartdataitems

  has_many :order_items , dependent: :destroy
  has_many :orders , :through => :order_items

  has_many :wishlist_items , dependent: :destroy
  has_many :wishlists , :through => :wishlist_items
end
