class Rename < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :address_id, :buyer_address_id
  end
end
