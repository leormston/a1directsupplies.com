class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :part_number
      t.string :image_url
      t.float :price
      t.string :category
      t.string :brand

      t.timestamps
    end
  end
end
