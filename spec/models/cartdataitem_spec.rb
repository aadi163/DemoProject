require 'rails_helper'

RSpec.describe Cartdataitem, type: :model do
  describe "Write test cases for cartdataitem" do
    context "association" do
    it { should belong_to(:product) }
    it { should belong_to(:cart) }
    end
  end
end
