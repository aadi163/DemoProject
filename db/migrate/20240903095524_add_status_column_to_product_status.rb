class AddStatusColumnToProductStatus < ActiveRecord::Migration[7.1]
  def change
    add_column :product_statuses, :status, :string
  end
end
