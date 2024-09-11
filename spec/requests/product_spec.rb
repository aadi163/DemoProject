require 'rails_helper'

RSpec.describe "Products", type: :request do
  
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category , name: "Fashion") }
  let(:subcategory) { FactoryBot.create(:subcategory, name: "mens wear" , category_id: category.id) }
  let(:product) { FactoryBot.create(:product, name: "shirt" , price: 200 , description: "new shirt" , quantity: 2 , user_id: user.id , subcategory_id: subcategory.id) }

  before do
    sign_in user
  end

  describe "GET new" do
    it 'renders the new template' do
      get new_product_path
      expect(assigns(:product)).to be_a_new(Product)
      expect(response).to have_http_status(:success)
    end
  end

  # describe "PRODUCT#create" do
  #   it "creates a new product" do
  #     product_params = { product: { name: "shirt" , price: 200 , description: "new shirt" , quantity: 2 , user_id: user.id , subcategory_id: subcategory.id , product_image: [Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png'), 'image/png')]} }
  #     post products_path , params: product_params 
  #     expect(response).to redirect_to(seller_product_list_path)
  #     expect(Product.last.name).to eq("shirt")
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "PRODUCT#edit" do
    it "edit product" do
      get :edit , params: { id: product.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:product)).to eq(product)
    end
  end   
end
