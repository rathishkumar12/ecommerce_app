class RemoveEmailPassForDevise < ActiveRecord::Migration[6.1]
  def change
    remove_column :buyers,:email,:string
    remove_column :buyers,:password,:string
    remove_column :sellers,:email,:string
    remove_column :sellers,:password,:string
  end
end
