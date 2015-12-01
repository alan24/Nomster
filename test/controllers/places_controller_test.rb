require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  
  test "index" do
   	FactoryGirl.create(:place)
   	get :index
   	assert_response :success
  end

  test "show find" do 
  	place = FactoryGirl.create(:place)
  	get :show, :id => place.id
  	assert_response :success
  end

  test "new user" do
  	user = FactoryGirl.create(:user)
  	sign_in user
  	get :new
  	assert_response :success
  end

  test "new user not signed in" do
  	get :new
  	assert_redirected_to new_user_session_path
  end

  test "create" do
    user = FactoryGirl.create(:user)
    sign_in user

    assert_difference 'Place.count' do
      post :create, {:place => {
          :name => 'yolo',
          :description => 'omg',
          :latitude => 42.3631519,
          :longitude => -71.056098,
        }
      }
    end
    assert_redirected_to places_path

    assert_equal 1, user.places.count
  end 

  test "create not signed in" do
  	assert_no_difference 'Place.count' do
  		post :create, {:place => {
  			:name => 'omg',
        :address => '123 Fake Street',
  			:description => 'best place ever'
  			}
  		}
  	end 
  	assert_redirected_to new_user_session_path
  end

  test "edit user not logged in" do
    place = FactoryGirl.create(:place)
    get :edit, :id => place.id
    assert_redirected_to new_user_session_path
  end

  test "edit logged in as different user" do
    user = FactoryGirl.create(:user)
    sign_in user

    place = FactoryGirl.create(:place)
    get :edit, :id => place.id
    assert_response :forbidden
  end 

  test "edit found" do
    place = FactoryGirl.create(:place)
    sign_in place.user

    get :edit, :id => place.id
    assert_response :ok
  end

  test "update not logged in" do
    place = FactoryGirl.create(:place, :name => 'Pizza')
    put :update, :id => place.id, :place => {:name => 'pizza store'}
    assert_redirected_to new_user_session_path
  end

  test "update as different user" do
    user = FactoryGirl.create(:user)
    sign_in user
    place = FactoryGirl.create(:place, :name => 'Pizza')
    put :update, :id => place.id, :place => {:name => 'Pizza store'}
    assert_response :forbidden
  end

end