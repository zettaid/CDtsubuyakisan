class Admin::CdsController < ApplicationController
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @cds = Cd.search(params[:search])
  end

  def index
    @cds = Cd.search(params[:search])
  end

  def new
    @cd = Cd.new
    @artist = Artist.new
    @artists = Artist.all
    @label = Label.new
    @labels = Label.all
    @genre = Genre.new
    @genres = Genre.all
    @music = Music.new
    @musics = Music.all
  end

  def create
    @cd = Cd.new(cd_params)
    if @cd.save
        flash[:notice] = "CD was successfully updated."
        redirect_to new_admin_cd_path
    else
        @cd = Cd.new
        @artist = Artist.new
        @artists = Artist.all
        @label = Label.new
        @labels = Label.all
        @genre = Genre.new
        @genres = Genre.all
        @music = Music.new
        @musics = Music.all
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
  end

  private
    def cd_params
        params.require(:cd).permit(:cd_name, :artist_id, :image, :price, :label_id, :stock, :genre_id)
    end
end
