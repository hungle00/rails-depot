class AdminController < ApplicationController

  def index
    @total_orders = Order.count
    authorize! :read, @post
  end
end
