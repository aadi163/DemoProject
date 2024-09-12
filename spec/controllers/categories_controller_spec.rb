require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) { FactoryBot.create(:category , name: "Fashion") }

  describe "GET index" do
    it 'renders the index template' do
      get :index
      expect(assigns(:categories)).to eq(Category.all)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it 'renders the new template' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
      expect(response).to have_http_status(:success)
    end
  end

  describe "CATEGORY#create" do
    it "creates a new category" do
      category_params = { category: { name: "Fashion" } }
      post :create, params: category_params
      expect(response).to redirect_to(categorylist_path)
      expect(Category.last.name).to eq("Fashion")
    end
  end

  describe "CATEGORY#edit" do
    it "edit category" do
      get :edit , params: { id: category.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "CATEGORY#update" do
    it "update category" do
      category = FactoryBot.create(:category , name: "new cloths")
      process :update, method: :patch, params: { id: category.id , name: "Cloths" }
      expect(response).to redirect_to(categorylist_path)
      expect(Category.last.name).to eq("Cloths")
    end
  end

  describe "DELETE #destroy" do
    it "deletes the category" do
      delete :destroy, params: { id: category.id}
      expect(response).to redirect_to(categorylist_path)
      expect(Category.exists?(category.id)).to be_falsey
    end
  end
end
