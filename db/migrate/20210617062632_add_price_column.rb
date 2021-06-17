class AddPriceColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :orders,:amount,:decimal
  end
end
