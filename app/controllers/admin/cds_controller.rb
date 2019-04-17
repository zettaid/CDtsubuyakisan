class Admin::CdsController < ApplicationController
  def index
    @Cds = Cd.search(params[:search])
  end

  def new
    @cd = Cd.new
    @artist = Artist.new
    @label = Label.new
    @genre = Genre.new
  end

  def create
    @cd = Cd.new(cd_params)
    @artists = Artist.all
    @genres = Genre.all
    @cd.artist_id = @artist.id
  end

  def edit
    @cd = Cd.find(params[:id])
  end

  def update
    @cd = Cd.find(params[:id])
    @cd.update(cd_params)
  end
end
