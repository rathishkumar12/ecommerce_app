class CreateTypeOfPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :type_of_payments do |t|
      t.string :name
      t.timestamps
    end
    add_column :orders , :address_id , :integer
    add_column :orders ,  :type_of_payment_id , :integer
  end
end
