class Public::UsersController < ApplicationController

	def top
    end

    def show
    	@user = User.find(params[:id])

        @cart = Cart.find(params[:id])
        @orders = @cart.orders

    	# ユーザのマイページ
    end

	def edit
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
    	@user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
    end


    private
        def user_params
        	params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_number, :address, :phone_number, :email)
        end
        def delete_user_params
            params.require(:user).permit(:deleated)
        end

end
