class Admin::HistoriesController < ApplicationController
  def index
    @orders = Order.all
    @carts = Cart.all
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
