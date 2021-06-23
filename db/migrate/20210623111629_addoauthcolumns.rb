class Addoauthcolumns < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :oauth_access_grants, :buyers, column: :resource_owner_id
    add_foreign_key :oauth_access_tokens, :buyers, column: :resource_owner_id
  end
end
