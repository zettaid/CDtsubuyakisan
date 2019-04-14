class Admin::ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
        format.js { @status = "success"}
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
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
end
