require "test_helper"

class UsersProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_profile_index_url
    assert_response :success
  end

  test "should get show" do
    get users_profile_show_url
    assert_response :success
  end

  test "should get new" do
    get users_profile_new_url
    assert_response :success
  end

  test "should get edit" do
    get users_profile_edit_url
    assert_response :success
  end
end
