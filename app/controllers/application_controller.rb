class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
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

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :post_number, :adress, :phone_number, :email])
	end


end