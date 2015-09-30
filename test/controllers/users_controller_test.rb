require 'test_helper'

class UsersControllerTest < ActionController::TestCase

 	test "user profile found" do
 		user = FactoryGirl.create(:user)
 		sign_in user

 		get :show, :id => user.id
 		assert_response :success
 	end

 	test "user profile not found" do
 		get :show, :id => 'omg'
 		assert_response :not_found
 	end

end
