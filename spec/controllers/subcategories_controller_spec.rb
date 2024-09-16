require 'rails_helper'

RSpec.describe SubcategoriesController, type: :controller do
  let(:category) { FactoryBot.create(:category , name: "Fashion") }
  let(:subcategory) { FactoryBot.create(:subcategory, name: "mens wear" , category_id: category.id) }

  describe "GET new" do
    it 'renders the new template' do
      get :new
      expect(assigns(:subcategory)).to be_a_new(Subcategory)
      expect(response).to have_http_status(:success)
    end
  end

  describe "CATEGORY#create" do
    it "creates a new sub_category" do
      subcategory_params = { subcategory: { name: "mens wear" , category_id: category.id} }
      post :create, params: subcategory_params
      expect(response).to redirect_to(categorylist_path)
      expect(Subcategory.last.name).to eq("mens wear")
    end
  end

  describe "CATEGORY#edit" do
    it "edit subcategory" do
      get :edit , params: { id: subcategory.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:subcategory)).to eq(subcategory)
    end
  end

  describe "CATEGORY#update" do
    it "update subcategory" do
      process :update, method: :patch, params: { id: subcategory.id , subcategory: {name: "kids wear"} }
      expect(Subcategory.last.name).to eq("kids wear")
      expect(response).to redirect_to(categorylist_path)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the category" do
      delete :destroy, params: { id: subcategory.id}
      expect(response).to redirect_to(categorylist_path)
      expect(Subcategory.exists?(subcategory.id)).to be_falsey
    end
  end
end
