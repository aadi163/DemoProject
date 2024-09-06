require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Write test cases for user" do
    context "association" do
      it { should have_one(:cart) }
      it { should have_one(:order) }
      it { should have_one(:wishlist) }
      it { should have_many(:useraddresses) }
      it { should have_many(:products) }
    end
  end
end
