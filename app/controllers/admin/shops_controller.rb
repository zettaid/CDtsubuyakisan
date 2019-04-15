class Admin::ShopsController < ApplicationController

	def show

	end

	def edit
		@shop = Shop.find(params[:id])

	end

	def update
	 @shop = Shop.find(params[:id])
     @shop.update(shop_params)
     redirect_to shop_path(@shop.id)
      
	end


	private
  
  def shop_params
  	params.require(:shop).permit(:name, :body, :master, :post_number, :address, :phone_number, :email)
  end


end
