class OrdersController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_not_empty, only: :new
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  DEPOT_POSITION = [21.0294498, 105.8544441]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders.includes(:line_items)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @line_items = @order.line_items
    @distance = @order.distance_to(DEPOT_POSITION).round(2)
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    @order.user_id = current_user.id
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderMailer.received(@order).deliver_later
        format.html { redirect_to store_index_url, notice: 'Order was successfully created.' }
        #format.html { render :show, status: :created, notice: 'Order was successfully created.'}
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
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
      params.require(:order).permit(:address, :pay_type)
    end

    def ensure_cart_not_empty
      if @cart.line_items.empty?
        redirect_to store_index_url, notice: 'Your cart is empty'
      end
    end
end
