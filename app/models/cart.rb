class Cart < ApplicationRecord
  belongs_to :user
  has_many :cartdataitems
  has_many :products , :through => :cartdataitems
end
