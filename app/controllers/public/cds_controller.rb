class Public::CdsController < ApplicationController
  def search
    @cds = Cd.search(params[:search])
  end

  def genre_search
    @cds = Cd.genre_search(params[:search])
  end

  def index
    if params[:id].present?
  	  @cds = Cd.genre_search(params[:id])
    else
      @cds = Cd.search(params[:search])
    end
  end


  def show
    @review = Review.new
    if signed_in?
      @user = current_user
    end
  	@cd = Cd.find(params[:id])
    @reviews = Review.where(cd_id: @cd.id)
    if @cd.deleated == true
        redirect_to public_cds_path
    else
        @musics1 = @cd.musics.order("disk_number")
        @musics = @musics1.order("track")
    end
    # @is_saved = false

  	# @user = current_user
  end

  def review_params
    params.require(:cds).permit(:artist, :cd_name, :image, :price, :deleated, :label, :stock, :genre)
  end
end
