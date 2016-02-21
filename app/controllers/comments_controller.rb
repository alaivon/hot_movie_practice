class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_movie

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
		@comment = @movie.comments.find(params[:id])
	end

	def update
		@comment = @movie.comments.find(params[:id])
		if @comment.update(comment_params)
			flash[:success] = "Updated your comment successfully"
			redirect_to movie_path(@movie)
		end
	end

	def destroy
		@comment = @movie.comments.find(params[:id])
		@comment.destroy
		flash[:notice] = "Already deleted your comment!"
		redirect_to movie_path(@movie)
	end

	private

	def find_movie
		@movie = Movie.find(params[:movie_id])
	end

	def comment_params
		params.require(:comment).permit(:comment)
	end
end
