module Api
  module V1
   
    class BuyersController < ApplicationController
      before_action :doorkeeper_authorize!
      protect_from_forgery with: :null_session
      respond_to :json


       

      def index
        respond_with Buyer.all
      end

      def create
        
        puts "oeihheoihroierhoiehoiwihow


        #{params}

       oegruegriuwegriueg "

      respond_with Buyer.create(buyer_params)

      end  

      def show
        respond_with Buyer.find(params[:id])
      end  

      def destroy
        if Buyer.find_by(id:params[:id]).nil?
          respond_with "Cant find the data"
        else
          respond_with Buyer.find(params[:id]).destroy
        end
      end


      def update
        buyer=Buyer.find(params[:id])
        buyer.update(buyer_name:params[:buyer_name])
        puts "kfuugu
        fyfyfy
        ifyiyf"


        puts buyer.errors.full_messages
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
      @current_buyer ||= Buyer.find_by(id: doorkeeper_token[:resource_owner_id])
      end
    end
  end
end