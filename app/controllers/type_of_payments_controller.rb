class TypeOfPaymentsController < ApplicationController
  before_action :set_type_of_payment, only: %i[ show edit update destroy ]

  # GET /type_of_payments or /type_of_payments.json
  def index
    @type_of_payments = TypeOfPayment.all
  end

  # GET /type_of_payments/1 or /type_of_payments/1.json
  def show
  end

  # GET /type_of_payments/new
  def new
    @type_of_payment = TypeOfPayment.new
  end

  # GET /type_of_payments/1/edit
  def edit
  end

  # POST /type_of_payments or /type_of_payments.json
  def create
    @type_of_payment = TypeOfPayment.new(type_of_payment_params)

    respond_to do |format|
      if @type_of_payment.save
        format.html { redirect_to @type_of_payment, notice: "Type of payment was successfully created." }
        format.json { render :show, status: :created, location: @type_of_payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type_of_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_payments/1 or /type_of_payments/1.json
  def update
    respond_to do |format|
      if @type_of_payment.update(type_of_payment_params)
        format.html { redirect_to @type_of_payment, notice: "Type of payment was successfully updated." }
        format.json { render :show, status: :ok, location: @type_of_payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_of_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_payments/1 or /type_of_payments/1.json
  def destroy
    @type_of_payment.destroy
    respond_to do |format|
      format.html { redirect_to type_of_payments_url, notice: "Type of payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_payment
      @type_of_payment = TypeOfPayment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_of_payment_params
      params.require(:type_of_payment).permit(:name)
    end
end
