require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  
  test "index" do
 	FactoryGirl.create(:place)
 	get :index
 	assert_response :success
  end

  test "show find" do 
  	FactoryGirl.create(:place)
  	get :show, :id => place.id
  	assert_response :success
  end

  test "show not found" do
  	get :show, :id => 'omgyolo'
  	assert_response :not_found
  end

end