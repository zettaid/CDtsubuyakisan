class Admin::ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to new_admin_cd_path
    else
      @cd = Cd.new
      @artist = Artist.new
      @label = Label.new
      @genre = Genre.new
      render new_admin_cd_path
    end
  end

  def edit
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
  end

  def destroy
  end

  private
    def artist_params
        params.require(:artist).permit(:name)
    end
end
