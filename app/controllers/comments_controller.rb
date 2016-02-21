class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_movie
	before_action :find_comment, except: [:new,:create]

	def new
		@comment = @movie.comments.new
	end

	def create
		@comment = @movie.comments.create(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to movie_path(@movie)
		end
	end

	def edit
		
	end

	def update
		if @comment.update(comment_params)
			flash[:success] = "Updated your comment successfully"
			redirect_to movie_path(@movie)
		end
	end

	def destroy
		@comment.destroy
		flash[:notice] = "Already deleted your comment!"
		redirect_to movie_path(@movie)
	end

	def upvote	
		@comment.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@comment.downvote_by current_user
		redirect_to :back
	end

	private

	def find_movie
		@movie = Movie.find(params[:movie_id])
	end

	def find_comment
		@comment = @movie.comments.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:comment, :rating)
	end
end
