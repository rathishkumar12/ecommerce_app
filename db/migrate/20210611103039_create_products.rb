class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.integer :seller_id
      t.decimal :price
      t.integer :quantity
      t.boolean :is_active

      t.timestamps
    end
  end
end
