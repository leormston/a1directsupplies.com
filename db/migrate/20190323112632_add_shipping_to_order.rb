class AddShippingToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shipping, :integer
  end
end
