require 'rails_helper'

RSpec.describe CategoriesController,type: :controller do 
	
	context 'GET #index' do 

		it 'returns success response' do
			get :index
			expect(response).to be_successful
	    end

	end	

end	