ActiveAdmin.register BuyerAddress do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :buyer_id, :street_name, :lat, :lon, :pincode_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:buyer_id, :street_name, :lat, :lon, :pincode_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column  :buyer_id, :as => :select, :collection => Buyer.find_by(id: :buyer_id).buyer_id
    column :street_name
    column :pincode_id
    column :created_at
    column :updated_at
    actions
  end
  filter :buyer_id , as: :select
  filter :pincode_id , as: :select
end
