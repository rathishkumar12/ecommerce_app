require 'rails_helper'

RSpec.describe BuyerAddress , :type => :model do


  context 'tests for validations' do


    it 'save BuyerAddress successfully' do
      @b=Buyer.new(buyer_name:'lakshmi',email:'18euee059@skcet.ac.in',phone_number:8681008767,password:'lakshmi123',is_active:true)
      @p=Pincode.new(pincode:641026,city:'coimbatore',area:'selvapuram')
     #Z b.save 
      p.save
      buyer=BuyerAddress.new(buyer_id:6,street_name:"kamatchi nagar",pincode_id:13)
      res=buyer.save
      puts "dfggggggggggggggggggggggi


      #{buyer.errors.full_messages}

      uffffffffffffffe"

      expect(res).to eq(true)

    end

  end  


end