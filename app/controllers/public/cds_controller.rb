class Public::CdsController < ApplicationController
  def search
  	@cds = Cd.search(params[:search])
  end

  def index
  	@cds = Cd.search(params[:search])
  end

  def show
  	# @cd = Cd.find(params[:id])
  	# @user = current_user
  end
end
