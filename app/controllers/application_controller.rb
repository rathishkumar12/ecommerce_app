class ApplicationController < ActionController::Base


	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :buyer_name , :email , :password, :phone_number,:seller_name,:seller_company_name )}
		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :hotelname , :email , :password , :current_password , :phno , :address, :firstname,:lastname )}
	end
end
