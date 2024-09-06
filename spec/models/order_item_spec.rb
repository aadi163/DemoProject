require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe "Write test cases for orderitem" do
    context "association" do
      it { should belong_to(:product) }
      it { should belong_to(:order) }
      it { should belong_to(:useraddress) }
      it { should have_one(:product_status) }
    end
  end
end
