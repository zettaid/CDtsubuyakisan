class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	helper_method :current_cart

	def current_cart
		# ログインしているかどうかで分岐がきまる。
		if session[:id]
			@cart = Cart.find(session[:id])
			# if user_signed_in?
			# 	@cart.update(user_id: current_user.id)
			# end
			redirect_to cart_path(@cart)

		else
			@cart = Cart.create(user_id: 1)
			session[:cart_id] = @cart.id
		end
	end
end
