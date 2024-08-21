class CreateCartdataitems < ActiveRecord::Migration[7.1]
  def change
    create_table :cartdataitems do |t|
      t.references :product, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
