class HomePageController < ApplicationController

	before_action :authenticate_buyer!, except: [:index, :home]
	before_action :set_trending  

	def index 

	end	
	
	def home

	end	

	def search
		
		pattern='%'+params[:search].to_s+'%'

		@search_keyword=params[:search].to_s
		if(@search_keyword.length>0)
		@search_products=Product.where( 'lower(name) LIKE ?' ,pattern).includes(:category,:seller)
		puts @search_products
		render 'home_page/search_results'
	    else
	    	render 'home_page/home'
	    end

	end

	private 
	def set_trending 
		@trendings=Product.where('quantity>0 and is_active=true').order("created_at DESC").limit(3).includes(:category)
		puts @trendings
	end	
end