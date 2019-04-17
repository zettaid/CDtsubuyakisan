class Admin::UsersController < ApplicationController


	def show

	end

	def edit
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])
        if @user.update(user_params)
  	        redirect_to admin_user_path(@user.id)
        else
            # @user = current_user ←これがあるとバリデーションが通っちゃう
        end

    end

	def index

	end


  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_number, :phone_number, :address, :email, :password, :admin, :deleted)
  end


end
