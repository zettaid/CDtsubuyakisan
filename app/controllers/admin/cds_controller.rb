class Admin::CdsController < ApplicationController
  before_action :authenticate_user!
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    if @cds = Cd.search(params[:search])
        flash[:notice] = "検索結果"
    else
    end
  end

  def index
    if current_user.admin != true
      redirect_to public_cds_path
    end
    @cds = Cd.search(params[:search])
    @artists = Artist.all
  end

  def new
    if current_user.admin != true
      redirect_to public_cds_path
    end
    @cd = Cd.new
    @artist = Artist.new
    @artists = Artist.all
    @label = Label.new
    @labels = Label.all
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    if current_user.admin != true
      redirect_to public_cds_path
    end
    @cd = Cd.new(cd_params)
    if @cd.save
        flash[:notice] = "CD was successfully updated."
        redirect_to new_admin_music_path
    else
        @cd = Cd.new
        @artist = Artist.new
        @artists = Artist.all
        @label = Label.new
        @labels = Label.all
        @genre = Genre.new
        @genres = Genre.all
        flash[:error] = "Any error has occurred."
        render :new
    end
  end

  def edit
    @cd = Cd.find(params[:id])
    @artist = Artist.new
    @artists = Artist.all
    @label = Label.new
    @labels = Label.all
    @genre = Genre.new
    @genres = Genre.all
  end

  def update
    @cd = Cd.find(params[:id])
    @cd.update(cd_params)
    redirect_to public_cd_path(@cd.id)
  end

  def destroy
    @cd = Cd.find(params[:id])
    @cd.update(delete_cd_params)
    redirect_to admin_cds_path
  end


  private
    def cd_params
        params.require(:cd).permit(:cd_name, :artist_id, :image, :price, :label_id, :stock, :genre_id, :deleated)
    end
    def delete_cd_params
        params.require(:cd).permit(:deleated)
    end
end
