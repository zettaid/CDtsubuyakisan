class Admin::MusicsController < ApplicationController
  def new
    @music = Music.new
    @cds = Cd.all
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

  private
    def music_params
        params.require(:music).permit(:disk_number, :track, :name, :cd_id)
    end
end
