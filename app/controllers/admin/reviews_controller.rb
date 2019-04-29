class Admin::ReviewsController < ApplicationController
    before_action :authenticate_user!
	def new
		@review = Review.new
    end

	def create
		@review = Review.new(review_params)
		@user = User.first
		@review.user_id = @user.id
	 if @review.save
		redirect_to root_path
     else
      	redirect_to root_path
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
		@review = Review.find(params[:id])
        @review.update(review_params)
		redirect_to root_path
	end



	private

    def review_params
	 	params.require(:review).permit(:image, :text, :user_id, :cd_id, :deleated)
    end
end