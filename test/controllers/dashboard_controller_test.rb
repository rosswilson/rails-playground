require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)

    sign_in_as(@user)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end
end
