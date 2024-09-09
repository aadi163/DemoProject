require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Write test cases for product" do
    context "Validation" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:price) }
      it { should validate_presence_of(:product_image) }
    end
    context "association" do
      it { should have_many(:cartdataitems)}
      it { should have_many(:carts)}
      it { should have_many(:order_items)}
      it { should have_many(:orders)}
      it { should have_many(:wishlist_items)}
      it { should have_many(:wishlists)}
      it { should belong_to(:user) }
      it { should belong_to(:subcategory) }
      it { should have_one_attached(:product_image) }
    end
  end
end
