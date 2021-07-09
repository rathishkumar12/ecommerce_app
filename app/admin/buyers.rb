ActiveAdmin.register Buyer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
 # permit_params :buyer_name, :phone_number, :is_active, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at
  #
  # or
  #

   action_item :deactivate , only: :show do
    if buyer.is_active
      link_to "Deactivate Account", deactivate_admin_buyer_path(buyer) , method: :put
    else
      link_to "Activate Account" ,deactivate_admin_buyer_path(buyer) , method: :put
    end
  end

  member_action :deactivate , method: :put do
    buyer = Buyer.find_by(id: params[:id])
    buyer.update(is_active: !buyer.is_active)
    redirect_to admin_buyer_path(buyer)
  end

  
   permit_params do
     permitted = [:buyer_name, :phone_number, :is_active, :email, :encrypted_password, :reset_password_sent_at, :remember_created_at, :confirmed_at, :confirmation_sent_at]
     permitted << :other if params[:action] == 'create' && current_buyer.admin?
     permitted
   end
  filter :buyer_name , as: :select
  filter :phone_number , as: :select
  filter :email , as: :select
end
