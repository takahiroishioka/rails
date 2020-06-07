require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get tasks_home_url
    assert_response :success
  end

end
