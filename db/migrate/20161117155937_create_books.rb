class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.string :description
      t.boolean :coupons
      t.integer :user_id
      t.timestamps
    end
  end
end
