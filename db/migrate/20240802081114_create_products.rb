class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :quantity
      t.string :category
      t.text :description
      t.string :subcategory
      t.references :subcategory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
