class Admin::LabelsController < ApplicationController
  def new
  	@label = Label.new
  end

  def create
  	@label = Label.new(label_params)
    if @lebel.save
      format.html { redirect_to @lebel, notice: 'Label was successfully created.' }
      format.js { @status = "success"}
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
