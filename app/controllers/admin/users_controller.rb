class Admin::UsersController < ApplicationController
    def search
        if @users = User.search(params[:search])
            flash[:notice] = "検索結果"
        else
        end
    end

    def show
    	@user = User.find(params[:id])
    	#管理者のマイページ
    end

    def index
    	@user = current_user
    	@users = User.where(activated: true).search(params[:search])
        @cd_users = User.all
        #会員一覧ページ
    end

    def edit
	    @user = User.find(params[:id])
	end

    def destroy
    	@user = User.find(params[:id])
        @user.destroy
        redirect_to admin_users_path
    end

    private
        def delete_user_params
            params.require(:user).permit(:deleated)
        end

end

