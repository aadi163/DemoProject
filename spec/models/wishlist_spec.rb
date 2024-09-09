require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  describe "Write test cases for wishlist" do
    context "association" do
      it { should belong_to(:user) }
      it { should have_many(:wishlist_items) }
      it { should have_many(:wishlists) }
    end
  end
end
