class Public::CartsController < ApplicationController
	# application_controller.rbで設定したcurrent_cartメソッドを呼んでいる。そこで@cartを設定しているので@cartを呼ぶ必要はない。

		def show
			# if(@cart.deleted == false)
				# @orders = @cart.orders
				@cart = Cart.find(params[:id])
				@orders = @cart.orders
        		@sum = @orders.inject(0){ |result,order| result += order.price.to_i * order.quantity.to_i }.to_s(:delimited)
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
			redirect_to public_cart_path(@order)
		end

		def destroy
			# 論理削除のプロセス
			@user = User.find(params[:id])
			@cart = Cart.find(params[:id])
			@cart.update(deleted: true)
			#論理削除されユーザーに新しいカートが付与される。（今までのカートから切り替わる。）
			# @extracart = Cart.new
			# binding.pry
			redirect_to public_cart_confirm_path(@cart)
		end

		# カート内商品の削除(orderの削除)に関するメソッド
		# cart_idとorderのid両方必要。
		def delete_order
			@cart = Cart.find(params[:cart_id])
			@order = Order.find_by(cart_id: @cart.id,id: params[:id])
			# binding.pry
			@order.destroy
			# redirect_to current_cart
			redirect_to public_cart_path(@cart.id)
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

	



end
