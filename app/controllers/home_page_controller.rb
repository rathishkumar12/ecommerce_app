class HomePageController < ApplicationController

	def index 

	end	
	
	def home

	end	

	def search
		
		pattern='%'+params[:search].to_s+'%'

		@search_keyword=params[:search].to_s
		if(@search_keyword.length>0)
		@search_products=Product.where( 'lower(name) LIKE ?' ,pattern).preload(:category)
		puts @search_products
		render 'home_page/search_results'
	    else
	    	render 'home_page/home'
	    end

	end
end