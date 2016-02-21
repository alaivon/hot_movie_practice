# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  director    :string
#  category_id :integer
#  length      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MoviesController < ApplicationController
	before_action :find_movie, except: [:index, :new, :create]
	before_action :authenticate_user!, except: [:index, :show]

	def index
	@movies = Movie.all	
	end

	def show
		@comments = @movie.comments.all
		if @comments.blank?
			@avg_rating = 0
		else
			@avg_rating = @comments.average(:rating).round(2)
		end
	end

	def new
		@movie = current_user.movies.build
	end

	def create
		@movie = current_user.movies.build(movie_params)
		if @movie.save
			redirect_to @movie
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		if @movie.update(movie_params)
			redirect_to @movie
		else
			render :edit
		end
	end

	def destroy
		@movie.destroy
		redirect_to root_path
	end

	def upvote
		@movie.upvote_by current_user
		redirect_to :back
	end

	private

	def find_movie
		@movie = Movie.find(params[:id])
	end

	def movie_params
		params.require(:movie).permit(:title, :description, :director, :category_id, :length, :image)
	end
end

