require 'rails_helper'

RSpec.describe Category , :type => :model do


  context 'tests for validations' do

    it 'ensures Category name exist' do

      category=Category.new.save

      expect(category).to eq(false)

    end

    it 'save Category successfully' do

      category=Category.new(category_name:"Bikes").save

      expect(category).to eq(true)

    end

  end  


end