require 'test_helper'

class CalendersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calenders_index_url
    assert_response :success
  end

  test "should get edit" do
    get calenders_edit_url
    assert_response :success
  end

  test "should get update" do
    get calenders_update_url
    assert_response :success
  end

  test "should get destroy" do
    get calenders_destroy_url
    assert_response :success
  end

end
