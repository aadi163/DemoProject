require 'rails_helper'

RSpec.describe WishlistItem, type: :model do
  describe "Write test cases for wishlist item" do
    context "association" do
      it { should belong_to(:wishlist) }
      it { should belong_to(:product) }
    end
  end
end
