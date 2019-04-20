class Admin::LabelsController < ApplicationController
  def new
  	@label = Label.new
  end

  def create
  	@label = Label.new(label_params)
    if @label.save
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
    @label = Label.find(params[:id])
    @label.update(label_params)
  end

  def destroy
  end

  private
    def label_params
        params.require(:label).permit(:name)
    end
end
