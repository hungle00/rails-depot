class AdminController < ApplicationController

  def index
    @total_orders = Order.count
    authorize! :read, @total_orders
  end
end
