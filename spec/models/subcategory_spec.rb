require 'rails_helper'

RSpec.describe Subcategory, type: :model do
  describe "Write test cases for subcategory" do
    context "association" do
      it { should belong_to(:category) }
      it { should have_many(:products) }
    end
  end
end
