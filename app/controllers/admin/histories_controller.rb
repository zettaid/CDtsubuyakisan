class Admin::HistoriesController < ApplicationController
  def index
    @history = History.search(params[:search])
    search = params[:search]
    @orders = Order.all
    

    @carts = Cart.all
  end

  def show
    
  end

  def edit
  end

  def update
    @history = History.find(params[:id])
    @history.update(history_params)
    redirect_to admin_histories_path
  end

  def destroy
  end

private
  def history_params
    params.require(:history).permit(:status)
  end

end
