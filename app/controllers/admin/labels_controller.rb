class Admin::LabelsController < ApplicationController
  def new
  	@label = Label.new
  end

  def create
  	@label = Label.new(label_params)
  	@label.save
  end

  def edit
  end

  def update
    @label = Label.find(params[:id])
    @label.update(label_params)
  end

  def destroy
  end
end
