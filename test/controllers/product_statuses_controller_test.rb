require "test_helper"

class ProductStatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get SetProductStatus" do
    get product_statuses_SetProductStatus_url
    assert_response :success
  end
end
