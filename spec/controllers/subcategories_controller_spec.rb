require 'rails_helper'

RSpec.describe SubcategoriesController, type: :controller do
  let(:category) { FactoryBot.create(:category , name: "Fashion") }

  describe "GET new" do
    it 'renders the new template' do
      get :new
      expect(assigns(:subcategory)).to be_a_new(Subcategory)
      expect(response).to have_http_status(:success)
    end
  end

  describe "CATEGORY#create" do
    it "creates a new sub_category" do
      subcategory_params = { category: { name: "mens wear" , category_id: category.id} }
      post :create, params: subcategory_params
      expect(response).to redirect_to(categorylist_path)
      expect(Subcategory.last.name).to eq("mens wear")
    end
  end
end
