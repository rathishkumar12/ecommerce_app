class SellerAddressesController < ApplicationController
  before_action :set_seller_address, only: %i[ show edit update destroy ]

  # GET /seller_addresses or /seller_addresses.json
  def index
    @seller_addresses = SellerAddress.all
  end

  # GET /seller_addresses/1 or /seller_addresses/1.json
  def show
  end

  # GET /seller_addresses/new
  def new
    @seller_address = SellerAddress.new
  end

  # GET /seller_addresses/1/edit
  def edit
  end

  # POST /seller_addresses or /seller_addresses.json
  def create
    @seller_address = SellerAddress.new(seller_address_params)

    respond_to do |format|
      if @seller_address.save
        format.html { redirect_to @seller_address, notice: "Seller address was successfully created." }
        format.json { render :show, status: :created, location: @seller_address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @seller_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seller_addresses/1 or /seller_addresses/1.json
  def update
    respond_to do |format|
      if @seller_address.update(seller_address_params)
        format.html { redirect_to @seller_address, notice: "Seller address was successfully updated." }
        format.json { render :show, status: :ok, location: @seller_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @seller_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seller_addresses/1 or /seller_addresses/1.json
  def destroy
    @seller_address.destroy
    respond_to do |format|
      format.html { redirect_to seller_addresses_url, notice: "Seller address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller_address
      @seller_address = SellerAddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seller_address_params
      params.require(:seller_address).permit(:seller_id, :street_name, :lat, :lon, :pincode_id)
    end
end
