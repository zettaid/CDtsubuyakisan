class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	helper_method :current_cart

	def current_cart
		# ログインしているかどうかで分岐がきまる。
		# if session[:cart_id]
		# 	@cart = Cart.find(session[:cart_id])
			# if user_signed_in?
			# 	@cart.update(user_id: current_user.id)
			# end

		else
			@cart = Cart.create(user_id: 1)
			session[:cart_id] = @cart.id
		end
	end
# end
