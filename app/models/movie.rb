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

class Movie < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "325x475>", thumb: "250x350>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates :title, presence: true
	validates :description, presence: true
	validates :length, numericality: {only_integer: true, less_than_or_equal_to: 999 }, presence: true
 
	belongs_to :user
	has_many :comments

	acts_as_votable
	
	extend FriendlyId
	friendly_id :title, use: [:slugged, :history]

	 def should_generate_new_friendly_id
	 	title_changed?
	 end


end
