class AddColumnToProductStatus < ActiveRecord::Migration[7.1]
  def change
    add_reference :product_statuses, :order_item, null: false, foreign_key: true
  end
end
