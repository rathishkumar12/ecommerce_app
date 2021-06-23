class DropTablename < ActiveRecord::Migration[6.1]
  def change
      drop_table :oauth_applications, force: :cascade
     
 
      drop_table :oauth_access_tokens, force: :cascade
  end
end
