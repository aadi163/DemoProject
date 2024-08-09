class CreateUseraddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :useraddresses do |t|
      t.string :name
      t.integer :phonenumber
      t.string :address
      t.string :city
      t.string :state
      t.integer :pincode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
