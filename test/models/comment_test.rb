require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  test "human_rating readable rating" do
  	rating = Comment.new(:rating => '1_star')
  	expected = 'one star'
  	actual = rating.humanized_rating
  	assert_equal expected, actual
  end
  
end
