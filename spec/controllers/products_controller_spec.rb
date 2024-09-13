require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category , name: "Fashion") }
  let(:subcategory) { FactoryBot.create(:subcategory, name: "mens wear" , category_id: category.id) }
  let(:product) { FactoryBot.create(:product, name: "shirt" , price: 200 , description: "new shirt" , quantity: 2 , user_id: user.id , subcategory_id: subcategory.id)}

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns a new Product to @product' do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "PRODUCT#create" do
    it "creates a new product and redirects to the seller_productlist" do
      process :create, method: :post ,  params: {product: {name: "shirt" , price: 200 , description: "new shirt" , quantity: 2 , user_id: user.id , subcategory_id: subcategory.id }}
      expect(response).to redirect_to(seller_product_list_path)
      expect(Product.last.name).to eq("shirt")
    end
  end

  describe 'GET #show' do
    it 'assigns the requested product to @product' do
      get :show, params: { id: product.id }
      expect(assigns(:product)).to eq(product)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested product to @product' do
      get :edit, params: { id: product.id }
      expect(assigns(:product)).to eq(product)
    end

    it 'renders the edit template' do
      get :edit, params: { id: product.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the product' do
        patch :update, params: { id: product.id, product: { name: 't-shirt' } }
        product.reload
        expect(product.name).to eq('t-shirt')
      end
      it 'redirects to the seller product list' do
        patch :update, params: { id: product.id, product: { name: 't-shirt' } }
        expect(response).to redirect_to(seller_product_list_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the product' do
      product 
      expect {
        delete :destroy, params: { id: product.id }
      }.to change(Product, :count).by(-1)
    end 
    it 'redirects to the seller product list' do
      delete :destroy, params: { id: product.id }
      expect(response).to redirect_to(seller_product_list_path)
    end
  end
end
