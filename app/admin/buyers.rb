ActiveAdmin.register Buyer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :buyer_name, :phone_number, :is_active, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:buyer_name, :phone_number, :is_active, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :buyer_name , as: :select
  filter :phone_number , as: :select
end
