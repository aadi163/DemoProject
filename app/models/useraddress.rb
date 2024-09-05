class Useraddress < ApplicationRecord
  validates :name, :phonenumber , :address , :city , :state , :pincode , presence: true
  belongs_to :user
  has_many :order_items , dependent: :destroy
  has_many :orders , :through => :order_items
end
