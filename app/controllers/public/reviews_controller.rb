class Public::ReviewsController < ApplicationController

	def edit
	end

	def update
	end

	def index
		@review = Review.new

	def create
	    @review = Review.new(review_params)
	    if  @review.save
		    render :success
		
	    end
	end


    private
	def review_params
	 	params.require(:review).permit(:image, :text, :user_id, :cd_id, :deleated)
    end
