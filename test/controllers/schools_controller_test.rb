require "test_helper"

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get schools_destroy_url
    assert_response :success
  end
end
