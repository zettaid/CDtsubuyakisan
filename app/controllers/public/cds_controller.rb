class Public::CdsController < ApplicationController
  def search
  	@cds = Cd.search(params[:keyword])
  end

  def index
  	@cds = Cd.all
  end

  def show
  	# @cd = Cd.find(params[:id])
  	# @user = current_user
  end
end
