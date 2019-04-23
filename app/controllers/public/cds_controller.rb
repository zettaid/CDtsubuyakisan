class Public::CdsController < ApplicationController
  def search
  	@cds = Cd.search(params[:search])
  end

  def index
  	@cds = Cd.search(params[:search])
  end

  def show
  	@cd = Cd.find(params[:id])
    if @cd.deleated == true
        redirect_to public_cds_path
    else
        @musics1 = @cd.musics.order("disk_number")
        @musics = @musics1.order("track")
    end
  	# @user = current_user
  end
end
