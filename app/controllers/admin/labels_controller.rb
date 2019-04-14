class Admin::LabelsController < ApplicationController
  def new
  	@label = Label.new
  end

  def create
  	@label = Label.new(label_params)
  	respond_to do |format|
      if @lebel.save
        format.html { redirect_to @lebel, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @label }
        format.js { @status = "success"}
      else
        format.html { render :new }
        format.json { render json: @label.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
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
end
