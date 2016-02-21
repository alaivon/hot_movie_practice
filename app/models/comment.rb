class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :movie
	 acts_as_votable
end
