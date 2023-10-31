class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart

  def index
    if session[:counter]
      session[:counter] += 1
    else
      session[:counter] = 0
    end
    @products = Product.order(:title)
  end
end
