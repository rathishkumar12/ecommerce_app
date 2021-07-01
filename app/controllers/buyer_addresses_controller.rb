class BuyerAddressesController < ApplicationController
  
  before_action :set_buyer_address, only: %i[ show edit update destroy ]
  before_action :authenticate_buyer!

  # GET /buyer_addresses or /buyer_addresses.json
  def index
    @buyer_addresses = BuyerAddress.where("buyer_id="+current_buyer.id.to_s)
  end

  # GET /buyer_addresses/1 or /buyer_addresses/1.json
  def show

  end

  # GET /buyer_addresses/new
  def new
    @buyer_address = BuyerAddress.new
  end

  # GET /buyer_addresses/1/edit
  def edit
  end

  # POST /buyer_addresses or /buyer_addresses.json
  def create

      @buyer_address = BuyerAddress.new(buyer_address_params)
      if @buyer_address.save
           render :template => 'shared/notification'
      else
        
      end
    
  end

  # PATCH/PUT /buyer_addresses/1 or /buyer_addresses/1.json
  def update
    respond_to do |format|

      if @buyer_address.update(buyer_address_params)
        format.html { redirect_to @buyer_address, notice: "Buyer address was successfully updated." }
        format.json { render :show, status: :ok, location: @buyer_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @buyer_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyer_addresses/1 or /buyer_addresses/1.json
  def destroy
    
    @buyer_address.destroy

    respond_to do |format|
      format.html { redirect_to buyer_addresses_url, notice: "Buyer address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer_address
      @buyer_address = BuyerAddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buyer_address_params
      res=params.require(:buyer_address).permit(:street_name,:pincode )
      res[:buyer_id]=current_buyer.id
      return set_pincode(res)
    end
    def set_pincode(res)
        if Pincode.find_by(pincode: res[:pincode]).nil?
          pincode=Pincode.new
          pincode.pincode=res[:pincode]
          pincode.save
          res["pincode_id"]=pincode.id
        else 
           pincode=Pincode.find_by(pincode:res[:pincode])
            res["pincode_id"]=pincode.id
        end 
         res.delete("pincode")
         return res
    end 
end
