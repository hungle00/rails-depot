class StoreController < ApplicationController
  skip_before_action :authenticate_user!
  
  include CurrentCart
  before_action :set_cart
  
  def index
    @products = Product.order(:title).paginate(page: params[:page], per_page: 15)
  end

end
