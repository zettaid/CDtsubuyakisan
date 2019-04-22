class Admin::MusicsController < ApplicationController
  def new
    @musics = Music.new
    @cds = Cd.where(deleated: 'false')
  end

  def create
    @musics = Music.new(musics_params)
    @musics.save
    redirect_to public_cd_path(@music.cd_id)
  end

  def edit
  end

  def update
    @musics = musics_params.keys.each do |id|
      music = Music.find(id)
      music.update_attributes(music_params[id])
      music
    end
    respond_with(@musics, location: edit_admin_music_path)
  end

  def destroy
    music = Music.find(params[:id])
    music.destroy
    redirect_to public_cd_path(music.cd_id)
  end

  private
    def musics_params
      params.require(:music).permit(:id, :disk_number, :track, :name, :cd_id])
    end
end
