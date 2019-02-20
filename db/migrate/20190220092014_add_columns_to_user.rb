class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :streetname, :string
    add_column :users, :city, :string
    add_column :users, :postcode, :string
  end
end
