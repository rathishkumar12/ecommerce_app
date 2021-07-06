ActiveAdmin.register Seller do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :seller_name, :seller_company_name, :phone_number, :is_active, :email, :encrypted_password, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:seller_name, :seller_company_name, :phone_number, :is_active, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  #end
  filter :seller_name, as: :select
  filter :seller_company_name, as: :select
  filter :phone_number, as: :select
  filter :email, as: :select
  
end
