class AdminController < ApplicationController
  #load_and_authorize_resource

  def index
    @total_orders = Order.count
    authorize! :read, @post
  end
end
