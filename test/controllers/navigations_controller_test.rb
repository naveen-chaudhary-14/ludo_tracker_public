require "test_helper"

class NavigationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get navigations_index_url
    assert_response :success
  end
end
