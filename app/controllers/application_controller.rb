class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception

	helper_method :current_cart

	def current_cart
	#ユーザーがログインしているかどうかの分岐
		if current_user
		# カートモデルのdeletedがfalse（論理削除してない）でログイン中のユーザーの場合
			if cart = Cart.find_by(deleted: false, user_id: current_user.id)
				# 外から見たときにcurrent_cartをcartとして使いたい。return。
				return cart
			else
				# カートを作るときにユーザーのIDを設定するのはなぜか？　＝＞　リレーション（親「current_user」　子[cart]） 親ができて子ができる。
				cart = Cart.create(user_id: current_user.id)
				return cart
			end
		else
			# current_cartメソッドの戻り値がない状態
			return nil
		end
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :post_number, :adress, :phone_number, :email])
	end


end