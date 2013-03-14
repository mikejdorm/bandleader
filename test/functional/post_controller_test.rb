require 'test_helper'

class PostControllerTest < ActionController::TestCase
  test "should get station_id:integer" do
    get :station_id:integer
    assert_response :success
  end

  test "should get post_time:" do
    get :post_time:
    assert_response :success
  end

  test "should get datetime" do
    get :datetime
    assert_response :success
  end

  test "should get content:text" do
    get :content:text
    assert_response :success
  end

  test "should get user_id:integer" do
    get :user_id:integer
    assert_response :success
  end

end
