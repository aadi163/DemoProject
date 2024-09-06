require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "Write test cases for order" do
    context "association" do
      it { should belong_to(:user) }
      it { should have_many(:order_items) }
      it { should have_many(:products) }
    end
  end
end
