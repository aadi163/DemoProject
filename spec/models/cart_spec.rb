require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "Write test cases for Category" do
    context "association" do
      it { should have_many(:cartdataitems)}
      it { should have_many(:products)}
      it { should belong_to(:user) }
    end
  end
end
