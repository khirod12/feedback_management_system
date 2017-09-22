require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
  end

  test "should get login" do
    get static_pages_login_url
    assert_response :success
  end

  test "should get admin" do
    get static_pages_admin_url
    assert_response :success
  end

  test "should get comments" do
    get static_pages_comments_url
    assert_response :success
  end

end
