require 'rails_helper'

RSpec.describe Category , :type => :model do


  context 'tests for validations' do

    it 'ensures Category name exist' do

      category=build(:category,category_name:'')
     
      expect(category.save).to eq(false)

    end

    it 'save Category successfully' do

      category=category=build(:category)

      expect(category.save).to eq(true)

    end

  end  


end