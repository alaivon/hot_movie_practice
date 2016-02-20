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

require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
