class Public::UsersController < ApplicationController

	def top
        @reviews = Review.all
        @genres = Genre.all
        @shop = Shop.find(1)
        if signed_in?
          @carts = Cart.where(user_id:current_user.id,deleted: false)
        end
    end

    def show
            @user = current_user
            # user_idがcurrent_userのidで論理削除されているカートを探す。
            @carts = Cart.where(user_id: current_user.id, deleted: true)
            @carts.each do |cart|
                orders = cart.orders
                sum = orders.inject(0){ |result,order| result += order.price.to_i * order.quantity.to_i }.to_s(:delimited)
                sum
            end
            # @orders = @carts.orders

            # <!-- historyモデルのcart_idでorderテーブルのcart_idと一致する最初の一件を取得 -->
            # @history = History.find_by(cart_id:@cart.id)
            # @sum = @orders.inject(0){ |result,order| result += order.price.to_i * order.quantity.to_i }.to_s(:delimited)
    	# ユーザのマイページ

    end

	def edit
           before_action :authenticate_user!
	       @user = User.find(params[:id])
		   if current_user.id == @user.id || current_user.admin == true
		    else
	        # redirect_to edit_public_user_path
           end
    end

    def update
        	@user = User.find(params[:id])
            @user.update(user_params)
            redirect_to public_user_path(@user.id)
    end

    def destroy
        	@user = current_user
            @users = User.find(params[:format])
            @users.destroy
            if current_user.id == @user.id || current_user.admin == true
            end
            redirect_to root_path
    end

    def delete
            @user = current_user
            @users = User.find(params[:id])
            if current_user.id == @user.id || current_user.admin == true
            end
    end


    private
        def user_params
        	params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_number, :address, :phone_number, :email)
        end
        def delete_user_params
            params.require(:user).permit(:deleated)
        end

end
