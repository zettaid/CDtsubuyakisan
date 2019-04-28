class Public::OrdersController < ApplicationController


# cartページから数量の変更をする際に利用するアクション
	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		redirect_to public_cart_path(@order.cart_id)
	end


	private
	def order_params
		params.require(:order).permit(:quantity)
	end
end
