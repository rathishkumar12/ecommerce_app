class PincodesController < ApplicationController
  before_action :set_pincode, only: %i[ show edit update destroy ]

  # GET /pincodes or /pincodes.json
  def index
    @pincodes = Pincode.all
  end

  # GET /pincodes/1 or /pincodes/1.json
  def show
  end

  # GET /pincodes/new
  def new
    @pincode = Pincode.new
  end

  # GET /pincodes/1/edit
  def edit
  end

  # POST /pincodes or /pincodes.json
  def create
    @pincode = Pincode.new(pincode_params)

    respond_to do |format|
      if @pincode.save
        format.html { redirect_to @pincode, notice: "Pincode was successfully created." }
        format.json { render :show, status: :created, location: @pincode }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pincode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pincodes/1 or /pincodes/1.json
  def update
    respond_to do |format|
      if @pincode.update(pincode_params)
        format.html { redirect_to @pincode, notice: "Pincode was successfully updated." }
        format.json { render :show, status: :ok, location: @pincode }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pincode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pincodes/1 or /pincodes/1.json
  def destroy
    @pincode.destroy
    respond_to do |format|
      format.html { redirect_to pincodes_url, notice: "Pincode was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pincode
      @pincode = Pincode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pincode_params
      params.require(:pincode).permit(:pincode, :city, :area)
    end
end
