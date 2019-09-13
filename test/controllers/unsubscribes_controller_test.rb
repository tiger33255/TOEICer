require 'test_helper'

class UnsubscribesControllerTest < ActionDispatch::IntegrationTest
  test "should get to" do
    get unsubscribes_to_url
    assert_response :success
  end

  test "should get users" do
    get unsubscribes_users_url
    assert_response :success
  end

end
