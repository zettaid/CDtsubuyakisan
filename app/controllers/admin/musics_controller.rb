class Admin::MusicsController < ApplicationController
  def new
    @music = Music.new
    @cds = Cd.all
  end

  def create
  	@music = Music.new(music_params)
  	@music.save
    redirect_to public_cd_path(@music.cd_id)
  end

  def edit
  end

  def update
    @music = Music.find(params[:id])
    @music.update(music_params)
  end

  def destroy
    music = Music.find(params[:id])
    music.destroy
    redirect_to public_cd_path(music.cd_id)
  end

  private
    def music_params
        params.require(:music).permit(:disk_number, :track, :name, :cd_id)
    end
end
