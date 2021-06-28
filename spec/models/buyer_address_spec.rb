require 'rails_helper'

RSpec.describe BuyerAddress , :type => :model do

  before do 
    @buyer=Buyer.new(buyer_name:'lakshmi',email:'18euee059@skcet.ac.in',phone_number:8681008767,password:'lakshmi123',is_active:true)
    @pincode=Pincode.new(pincode:641026,city:'coimbatore',area:'selvapuram')
    @buyer.skip_confirmation!
    @buyer.save 
    @pincode.save
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