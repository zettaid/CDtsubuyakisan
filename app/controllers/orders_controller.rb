class OrdersController < ApplicationController



	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		redirect_to cart_path(@order.cart_id)
	end


	private
	def order_params
		params.require(:order).permit(:quantity)
	end
end
