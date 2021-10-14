require 'test_helper'

class InstaclonesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instaclones_index_url
    assert_response :success
  end

  test "should get new" do
    get instaclones_new_url
    assert_response :success
  end

  test "should get show" do
    get instaclones_show_url
    assert_response :success
  end

  test "should get edit" do
    get instaclones_edit_url
    assert_response :success
  end

end
