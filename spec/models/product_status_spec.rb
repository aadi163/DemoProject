require 'rails_helper'

RSpec.describe ProductStatus, type: :model do
  describe "Write test cases for product_status" do
    context "association" do
      it { should belong_to(:order_item) }
    end
  end
end
