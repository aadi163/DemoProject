class RemoveColFromProductStatus < ActiveRecord::Migration[7.1]
  def change
    remove_column :product_statuses, :order_items_id, :bigint
  end
end
