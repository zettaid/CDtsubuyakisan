class Public::UsersController < ApplicationController
	def top
    end

    def show
    	@user = User.find(params[:id])
    	  if current_user.id == user.id || current_user.admin == true
		    else
	        redirect_to user_path
           end
    	# ユーザのマイページ
    end

	def edit
	    @user = User.find(params[:id])
		   if current_user.id == user.id || current_user.admin == true
		    else
	        redirect_to edit_user_path
           end
    end

    def update
    	@user = User.find(params[:id])
        @user.update(user_params)
    end
end
