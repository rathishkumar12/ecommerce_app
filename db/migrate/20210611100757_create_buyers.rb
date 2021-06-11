class CreateBuyers < ActiveRecord::Migration[6.1]
  def change
    create_table :buyers do |t|
      t.string :buyer_name
      t.string :email
      t.bigint :phone_number
      t.string :password
      t.boolean :is_active

      t.timestamps
    end
  end
end
