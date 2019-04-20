class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
    if @genre.save
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
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
  end

  def destroy
  end

  private
    def genre_params
        params.require(:genre).permit(:name)
    end
end