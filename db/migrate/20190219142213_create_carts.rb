class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.float :quantity
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
