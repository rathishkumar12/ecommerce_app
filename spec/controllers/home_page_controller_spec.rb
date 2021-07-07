require 'rails_helper'

RSpec.describe "HomePageController",type: :request do 

	

	context 'GET #home' do 

		it 'redirects buyer to login page when trying to access page without login' do
			get search_path+"?search=lays&commit=Search"
			expect(response).to redirect_to new_buyer_session_path
	    end

	    it 'renders search results when user logged in' do
	    	sign_in create(:buyer)
			get search_path+"?search=lays&commit=Search"
			expect(response).to render_template "home_page/search_results"
	    end

	    it 'renders homepage when search keyword is empty' do
	    	sign_in create(:buyer)
			get search_path+"?search=&commit=Search"
			expect(response).to render_template 'home_page/home'
	    end

	end	

end	