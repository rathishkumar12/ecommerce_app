class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.where('seller_id='+current_seller.id.to_s)
  end
  def index1
    @orders = Order.where('buyer_id='+current_buyer.id.to_s)
    render 'orders/index'
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @address = BuyerAddress.find_by(id:params[:address_id])
    $id_address=@address.id
    $id_product=params[:product_id]
    $id_seller=params[:seller_id]
  end

  # GET /orders/1/edit
  def edit
  end


  def order_confirmation
    @order_summary=Order.find(params[:order_id])
  end
  

  def address_select
    redirect_to  buyer_addresses_path
  end

   def address_selected
    redirect_to  new_order_path
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    @order_item =OrderItem.new 
    puts  @order_item.id
    puts "check"
      if @order.save 
         @order_item.order_id=@order.id
         @order_item.product_id=$id_product
         @order_item.quantity= $quantity
         if @order_item.save
          product=Product.find(@order_item.product_id)
          product.quantity-=$quantity
          if product.save
          redirect_to order_confirmation_path(:order_id =>@order.id )
          end
         end
      end
    
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      res=params.require(:order).permit(:status ,:type_of_payment_id ,:quantity)
      res[:buyer_id]=current_buyer.id
      res[:status]="Waiting for Seller Confirmation."
      res[:buyer_address_id]=$id_address
      if Product.find($id_product).price*res[:quantity].to_i < 500
      res[:amount]=(Product.find($id_product).price*res[:quantity].to_i)+50
       else
      res[:amount]=(Product.find($id_product).price*res[:quantity].to_i)
       end
       $quantity=res[:quantity].to_i
      res.delete("quantity")
      res[:seller_id]=$id_seller
      return res
    end
end
