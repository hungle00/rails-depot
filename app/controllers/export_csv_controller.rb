class ExportCsvController < ApplicationController
  def users
    @users = User.all
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def orders
    @orders = Order.all
    respond_to do |format|
      format.html
      format.csv { send_data @orders.to_csv, filename: "orders-#{Date.today}.csv" }
    end
  end
end