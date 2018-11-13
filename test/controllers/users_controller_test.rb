require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user       = users(:michael)
  end

  test "should redirect index when not logged in" do
  get users_path
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end
end
