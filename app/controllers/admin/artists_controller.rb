class Admin::ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
  end

  def edit
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
  end

  def destroy
  end
end
