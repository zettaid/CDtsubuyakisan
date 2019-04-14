class CartsController < ApplicationController
    def show
  		@cart = Cart.find(params[:id])
  		@orders = @cart.orders
    end
end
