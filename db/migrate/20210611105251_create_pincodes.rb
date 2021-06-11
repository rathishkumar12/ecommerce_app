class CreatePincodes < ActiveRecord::Migration[6.1]
  def change
    create_table :pincodes do |t|
      t.bigint :pincode
      t.string :city
      t.string :area

      t.timestamps
    end
  end
end
