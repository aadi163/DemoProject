require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category , name: "Fashion") }
  let(:subcategory) { FactoryBot.create(:subcategory, name: "mens wear" , category_id: category.id) }
  let(:product) { FactoryBot.create(:product, name: "shirt" , price: 200 , description: "new shirt" , quantity: 2 , user_id: user.id , subcategory_id: subcategory.id,
  product_image: [Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png'), 'image/png')])}

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

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new product' do
        expect {
          post :create, params: { product: attributes_for(:product, subcategory_id: subcategory.id, user_id: user.id , name: "shirt" , price: 200 , description: "new shirt" , quantity: 2 , product_image: [Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png'), 'image/png')])}
        }.to change(Product, :count).by(1)
      end

      it 'redirects to the seller product list' do
        post :create, params: { product: attributes_for(:product, subcategory_id: subcategory.id, user_id: user.id) }
        expect(response).to redirect_to(seller_product_list_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new product' do
        expect {
          post :create, params: { product: attributes_for(:product, name: nil) }
        }.to_not change(Product, :count)
      end

      it 'renders the new template' do
        post :create, params: { product: attributes_for(:product, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested product to @product' do
      get :show, params: { id: product.id }
      expect(assigns(:product)).to eq(product)
    end

    it 'assigns similar products to @similar_products' do
      similar_product = create(:product, subcategory: subcategory)
      get :show, params: { id: product.id }
      expect(assigns(:similar_products)).to include(similar_product)
    end

    it 'renders the show template' do
      get :show, params: { id: product.id }
      expect(response).to render_template(:show)
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
        patch :update, params: { id: product.id, product: { name: 'Updated Name' } }
        product.reload
        expect(product.name).to eq('Updated Name')
      end

      it 'redirects to the seller product list' do
        patch :update, params: { id: product.id, product: { name: 'Updated Name' } }
        expect(response).to redirect_to(seller_product_list_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not update the product' do
        patch :update, params: { id: product.id, product: { name: nil } }
        product.reload
        expect(product.name).not_to be_nil
      end

      it 'renders the edit template' do
        patch :update, params: { id: product.id, product: { name: nil } }
        expect(response).to render_template(:edit)
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
