class RemoveUserRoleColumnFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :user_role, :string
  end
end
