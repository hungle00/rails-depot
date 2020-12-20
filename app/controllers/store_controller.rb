class StoreController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  
  include CurrentCart
  before_action :set_cart
  
  def index
    @products = Product.order(:title)
  end

end
