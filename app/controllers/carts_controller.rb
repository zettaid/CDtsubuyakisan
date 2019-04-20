class CartsController < ApplicationController
	# application_controller.rbで設定したcurrent_cartメソッドを呼んでいる。そこで@cartを設定しているので@cartを呼ぶ必要はない。
	before_action :current_cart, only: [:show, :confirm]

		def show
			# @orders = @cart.orders
			@cart = Cart.find(params[:id])
			@orders = @cart.orders
			# @orders = @cart.orders
		end

		def create
			if @order.blank?
			   @order = current_cart.orders.build(cd_id: params[:cd_id])
			end

			@order.quantity += params[:quantity].to_i
			@order.save
			redirect_to current_cart
		end



		def edit
		end
		def update
		end

		def destroy
			@order.destroy
			redirect_to current_cart
		end

		def confirm
			@user = @cart.user
		end



end
