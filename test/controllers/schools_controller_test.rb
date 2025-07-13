require "test_helper"

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get schools_edit_url
    assert_response :success
  end

  test "should get update" do
    get schools_update_url
    assert_response :success
  end
end
