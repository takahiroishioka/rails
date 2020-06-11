require 'test_helper'

class StaffsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get staffs_create_url
    assert_response :success
  end

  test "should get destroy" do
    get staffs_destroy_url
    assert_response :success
  end

end
