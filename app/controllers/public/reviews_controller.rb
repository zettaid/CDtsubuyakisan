class Public::ReviewsController < ApplicationController

def new
		@review = Review.new
    end

	def create
		# cd = Cd.find(params[:id])
		@review = current_user.reviews.new(review_params)
		@review.cd_id = params[:review][:cd_id].to_i
		# review.cd_id = cd

	 if @review.save
		# @user = current_user
		# @cd = Cd.find(params[:review][:cd_id])
		# @reviews = Review.where(cd_id: @cd.id)
  #   	if @cd.deleated == true
  #       	redirect_to public_cds_path
  #   	else
  #       	@musics1 = @cd.musics.order("disk_number")
  #       	@musics = @musics1.order("track")
  #  		end
  #  		@is_saved = true
  p ""
  		redirect_to root_path
		# render template: "public/cds/show"
     else
      	redirect_to root_path
      end
	end


	def edit
		@review = Review.find(params[:id])
	end

	def index
		@user = current_user
		@reviews = @user.reviews.all
	end

	def update
		@review = Review.find(params[:id])
		@user = User.first
		@review.user_id = @user.id
      if  @review.update(review_params)
		redirect_to root_path
	  else
      	redirect_to root_path
      end
	end

	def show
	end

	def destroy
   	    @review = Review.find(params[:id])
   	    @review.destroy
   	    redirect_to root_path
    end

    def edit
    	@review = Review.find(params[:id])

    end





	private

    def review_params
	 	params.require(:review).permit(:image, :text, :user_id, :cd_id, :deleated)
    end
end