class AddSubTotalToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :subtotal, :float
  end
end
