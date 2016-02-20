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

module MoviesHelper

	  def youtube(content)
      context = { gfm: true}
      pipeline = HTML::Pipeline.new [
    HTML::Pipeline::YoutubeFilter,
    ], context
  
    pipeline.call(content)[:output].to_s.html_safe
  end
end
