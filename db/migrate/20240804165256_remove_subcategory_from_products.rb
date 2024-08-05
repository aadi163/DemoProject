class RemoveSubcategoryFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :subcategory, :string
  end
end
