module Api
  module V1
   
    class BuyersController < ApplicationController
      before_action :doorkeeper_authorize! unless Rails.env.test?
      protect_from_forgery with: :null_session
      respond_to :json
      
      def index
        respond_with Buyer.all
      end

      def create
        
       buyer=Buyer.new(buyer_params)
       buyer.skip_confirmation!
       buyer.save
       render json: {errors:buyer.errors.full_messages}
      end  

      def show
        respond_with Buyer.find(params[:id])
      end  

      def destroy
        if Buyer.find_by(id:params[:id]).nil?
          render json: {message:'no user found'}
        else
           buyer=Buyer.find(params[:id])
           buyer.destroy
          render json: {errors:buyer.errors.full_messages}
        end
      end
      def buyer_order 
      
        render json: {buyer_details:Buyer.find_by(email:params[:email]) ,orders: Buyer.find_by(email:params[:email]).order}
      end
      def update
        buyer=Buyer.find(params[:id])
        buyer.update(buyer_name:params[:buyer_name])
        render json: {errors:buyer.errors.full_messages}
      end  

      private 
      def  buyer_params
        res={}
        res[:buyer_name]=params[:buyer_name]
        res[:phone_number]=params[:phone_number]
        res[:email]=params[:email]
        res[:password]=params[:password]
        res[:is_active]=params[:is_active]
        return res
      end  
      def current_buyer
      @current_buyer = Buyer.find_by(id: doorkeeper_token[:resource_owner_id])
      end
    end
  end
end