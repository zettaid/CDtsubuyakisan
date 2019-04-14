class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
    respond_to do |format|
      if @genre.save
        format.html { redirect_to @genre, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @genre }
        format.js { @status = "success"}
      else
        format.html { render :new }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
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
end