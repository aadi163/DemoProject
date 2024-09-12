require 'rails_helper'

  # RSpec.describe "Carts", type: :request do
  #   describe "GET /carts" do
  #     it "renders the index template" do
  #       get :index
  #       # expect(response).to be_successful
  #       expect(response).to have_http_status(:success)
  #       # expect(response).to render_template("/carts")
  #     end
  #   end

RSpec.describe CartsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:cart) { FactoryBot.create(:cart, user: user) }

  describe "GET index" do
    it 'renders the index template' do
      get :index
      expect(assigns(:cartitems)).to eq(Cartdataitem.all)
      expect(response).to have_http_status(:success)
    end
  end
end
