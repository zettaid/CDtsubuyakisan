class Admin::UsersController < ApplicationController


    def show
    	@user = User.find(1)
    	#管理者のマイページ
    end

    def index
    	@user = current_user
    	@users = User.where(activated: true).search(params[:search])
        @cd_users = User.all
    end



    def edit
	    @user = User.find(1)
	end

    def destroy
    	@user = User.find(1)
        @user.destroy
        redirect_to users_index_path
    end

end

