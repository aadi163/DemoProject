require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
  let(:category) { FactoryBot.create(:category , name: "Fashion") }
  let(:subcategory) { FactoryBot.create(:subcategory, name: "mens wear" , category_id: category.id) }
  let(:product) { FactoryBot.create(:product, name:"shirt" , price:200 , quantity:2 , description:"mens shirt" , product_image: "test.png" , subcategory_id: subcategory.id) }
  # let(:post_params) { { : { product_image: [] , product_id: product.id } } }

  describe "GET index" do
    it 'renders the index template' do
      get :index
      expect(assigns(:products)).to eq(Product.all)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET filter_products" do
    it 'renders the products template' do
      # get "/homepage/#{category.id}/filter_products"
      get :filter_products
      expect(assigns(:categoryProducts)).to eq(product)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET search_products" do
    it 'renders the products template' do
      get :search_products
      expect(assigns(:categoryProducts)).to eq(product)
      expect(response).to have_http_status(:success)
    end
  end
end


