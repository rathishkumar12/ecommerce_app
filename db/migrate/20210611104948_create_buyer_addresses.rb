class CreateBuyerAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :buyer_addresses do |t|
      t.integer :buyer_id
      t.text :street_name
      t.string :lat
      t.string :lon
      t.integer :pincode_id

      t.timestamps
    end
  end
end
