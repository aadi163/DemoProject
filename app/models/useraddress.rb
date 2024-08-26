class Useraddress < ApplicationRecord
  belongs_to :user
  has_many :order_items , dependent: :destroy
  has_many :orders , :through => :order_items
end
