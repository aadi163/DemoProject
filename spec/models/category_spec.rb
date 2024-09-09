require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Write test cases for Category" do
    context "association" do
    it { should have_many(:subcategories) }
    end
  end
end
