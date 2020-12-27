class StoreController < ApplicationController
  skip_before_action :authenticate_user!
  
  include CurrentCart
  before_action :set_cart
  
  def index
    @products = Product.paginate(page: params[:page], per_page: 15)
    
    if params[:order] && params[:order] == "Sort by price"
      @products = @products.sort_by_price
    elsif params[:order] && params[:order] == "Sort by title"
      @products = @products.sort_by_title
    else
      @products = @products.discount
    end
  end

end
