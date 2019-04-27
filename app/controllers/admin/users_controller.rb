class Admin::UsersController < ApplicationController
    def search
            if @cd_users = User.search(params[:search])
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
        	@cd_users = if params[:search]
                User.search(params[:search])
            else
                User.all
            end
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

    def delete
            @user = current_user
            #会員退会ページ
    end

    private
            def delete_user_params
                params.require(:user).permit(:deleated)
            end

end

