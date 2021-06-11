class CreateSellers < ActiveRecord::Migration[6.1]
  def change
    create_table :sellers do |t|
      t.string :seller_name
      t.string :seller_company_name
      t.string :email
      t.bigint :phone_number
      t.string :password
      t.boolean :is_active

      t.timestamps
    end
  end
end
