require "test_helper"

class AdminhomepageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adminhomepage_index_url
    assert_response :success
  end
end
