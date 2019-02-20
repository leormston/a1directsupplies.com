class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float 'total'
      t.integer 'user_id'
      t.string 'Street'
      t.string 'City'
      t.string 'Postcode'
      t.timestamps
    end
  end
end
