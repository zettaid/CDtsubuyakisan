class Admin::MusicsController < ApplicationController
  def new
    if current_user.admin != true
      redirect_to public_cds_path
    end
    @music = Music.new
    @cds = Cd.where(deleated: 'false')
  end

  def create
    musics = musics_params
    musics.each do |music|
      m = Music.new(music_params(music))
      m.save
    end
    redirect_to public_cds_path
  end

  def edit
  end

  def update
    @music = Music.find(params[:id])
    @music.update(music_params)
  end

  def destroy
    if current_user.admin != true
      redirect_to public_cds_path
    end
    music = Music.find(params[:id])
    music.destroy
    redirect_to public_cd_path(music.cd_id)
  end

  private
    def musics_params
        params.require(:musics)
    end

    def music_params(music)
      music.require(:music).permit(:name, :cd_id, :disk_number, :track)
    end
end
