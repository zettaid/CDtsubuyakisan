class Admin::UsersController < ApplicationController

    def show
    	@user = User.find(params[:id])
    	#管理者のマイページ
    end

    def index
    	@users = User.search(params[:search])
    	@users = User.where(activated: true)
    end

    def destroy
    	@user = User.find(params[:id])
        @user.destroy
        redirect_to users_index_path
    end

end

