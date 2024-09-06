require 'rails_helper'

RSpec.describe Useraddress, type: :model do
  describe "Write test cases for useraddress" do
    context "Validation" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:phonenumber) }
      it { should validate_presence_of(:city) }
      it { should validate_presence_of(:state) }
      it { should validate_presence_of(:pincode) }
    end
    context "association" do
      it { should belong_to(:user)}
      it { should have_many(:order_items)}
      it { should have_many(:orders)}
    end
  end
end
