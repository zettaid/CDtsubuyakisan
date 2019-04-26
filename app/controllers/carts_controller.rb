class CartsController < ApplicationController
	# application_controller.rbで設定したcurrent_cartメソッドを呼んでいる。そこで@cartを設定しているので@cartを呼ぶ必要はない。

		def show
			# if(@cart.deleted == false)
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
			@order = Order.find(params[:id])
			@order.update(order_params)
			redirect_to cart_path(@order)
		end

		def destroy
			# 論理削除のプロセス
			@cart = Cart.find(params[:id])
			@cart.update(deleted: true)
			redirect_to cart_confirm_path(@cart)
		end

		# カート内商品の削除(orderの削除)に関するメソッド
		def delete_order
			@cart = Cart.find(params[:cart_id])
			@order = Order.find_by(cart_id: @cart.id,id: params[:id])
			# binding.pry
			@order.destroy
			# redirect_to current_cart
			redirect_to cart_path(@cart.id)
		end

		def confirm
			@cart = Cart.find(params[:cart_id])
			@user = @cart.user

			# historyのインスタンスを作る。
			@history = History.new
			@history.cart_id = @cart.id
			@history.user_last_name = @user.last_name
			@history.user_first_name = @user.first_name
			@history.address = @user.address
			@history.post_number = @user.post_number
			@history.save!
		end

	private
	def order_params
		params.require(:order).permit(:quantity)
	end



end
