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

	def index
	@movies = Movie.all	
	end

	def show
		
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(movie_params)
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

	private

	def find_movie
		@movie = Movie.find(params[:id])
	end

	def movie_params
		params.require(:movie).permit(:title, :description, :director, :category_id, :length)
	end
end

