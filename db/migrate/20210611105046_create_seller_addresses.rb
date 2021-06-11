class CreateSellerAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :seller_addresses do |t|
      t.integer :seller_id
      t.text :street_name
      t.string :lat
      t.string :lon
      t.integer :pincode_id

      t.timestamps
    end
  end
end
