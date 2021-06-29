require 'rails_helper'

RSpec.describe BuyerAddress , :type => :model do

  before do 
    @pincode=create(:pincode)
    @buyer=create(:buyer)
  end  

  context 'tests for validations' do

    it 'ensures presence of street_name' do
      buyer_address=BuyerAddress.new(buyer_id:@buyer.id,pincode_id:@pincode.id)
      result=buyer_address.save
      expect(result).to eq(false)
    end


    it 'save BuyerAddress successfully' do
      buyer_address=BuyerAddress.new(buyer_id:@buyer.id,street_name:"kamatchi nagar",pincode_id:@pincode.id)
      result=buyer_address.save
      expect(result).to eq(true)
    end

  end  


end