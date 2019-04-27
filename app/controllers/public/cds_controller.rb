class Public::CdsController < ApplicationController
  def search
  	@cds = Cd.search(params[:search])
  end

  def index
  	@cds = Cd.search(params[:search])
  end


  def show
    @review = Review.new
    @user = current_user
    @reviews = @user.reviews.all
  	@cd = Cd.find(params[:id])
    @reviews = Review.where(cd_id: @cd.id)
    if @cd.deleated == true
        redirect_to public_cds_path
    else
        @musics1 = @cd.musics.order("disk_number")
        @musics = @musics1.order("track")
    end
  	# @user = current_user
  end

  def review_params
    params.require(:cds).permit(:artist, :cd_name, :image, :price, :deleated, :label, :stock, :genre)
  end
end
