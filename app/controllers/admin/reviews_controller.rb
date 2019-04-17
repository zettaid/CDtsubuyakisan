class Admin::ReviewsController < ApplicationController

	def new
		@review = Review.new
    end

	def create

		@review = Review.new(review_params)
	 if @review.save!
		redirect_to root_path
     else
      	redirect_to admin_shops_path
      end
	end

	def show
	end

	def edit
		@review = Review.find(params[:id])
	end

	def index
		@review = Review.new
	end

	def update
	end



	private

    def review_params
	 	params.require(:review).permit(:image, :text, :user_id, :cd_id, :deleated)
    end
end