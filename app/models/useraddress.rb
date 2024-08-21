class Useraddress < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :orders , :through => :order_items
end
