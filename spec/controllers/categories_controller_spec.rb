require 'rails_helper'

RSpec.describe CategoriesController,type: :controller do 

	context 'GET #index' do 

		it 'returns success response' do
			get :index
			expect(response).to be_success
	    end

	end	

	context 'GET #show' do 

		it 'returns success response' do
			category=Category.create(category_name:"bikes")
			get :show ,params:{id:category.to_param}
			expect(response).to be_success
	    end

	end	

end	