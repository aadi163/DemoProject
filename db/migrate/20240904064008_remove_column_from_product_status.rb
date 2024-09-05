class RemoveColumnFromProductStatus < ActiveRecord::Migration[7.1]
  def change
    remove_column :product_statuses, :product_id, :bigint
  end
end
