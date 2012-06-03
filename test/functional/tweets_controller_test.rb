require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get simple_search" do
    get :simple_search
    assert_response :success
  end

  test "should get advanced_search" do
    get :advanced_search
    assert_response :success
  end

end
