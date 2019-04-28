class Admin::HistoriesController < ApplicationController
  def search
    search = params[:search]
    @history = History.search(params[:search])
  end


  def index
    # @history = History.search(params[:search])
    # search = params[:search]
    @orders = Order.all
    @carts = Cart.all
    # @sum = @orders.inject(0){ |result,order| result += order.price.to_i * order.quantity.to_i }.to_s(:delimited)
    # @cart = Cart.find(params[:id])
  end

  def show
  end

  def edit
  end

# 配送状況を変えるアクション。
  def update
    @history = History.find(params[:id])
    @history.update(history_params)
    redirect_to admin_histories_path
  end

  def destroy
  end

# historyモデルにあるenumと関連付け
private
  def history_params
    params.require(:history).permit(:status)
  end

end
