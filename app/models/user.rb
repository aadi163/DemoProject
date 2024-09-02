class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  enum role: {customer: 0 , seller: 1}

  has_one :cart
  has_one :order
  has_one :wishlist
  has_many :addresses
end
