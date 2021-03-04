class Admin::OrdersController < ApplicationController
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @orders = Order.all
    @total_orders = Order.count
  end

  def export
    @orders = Order.all
    respond_to do |format|
      format.html
      format.csv { send_data @orders.to_csv, filename: "orders-#{Date.today}.csv" }
    end
  end
end
