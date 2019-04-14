class Admin::MusicsController < ApplicationController
  def new
    @music = Music.new
  end

  def create
  	@music = Music.new(music_params)
  	@music.save
  end

  def edit
  end

  def update
    @music = Music.find(params[:id])
    @music.update(music_params)
  end

  def destroy
  end
end
