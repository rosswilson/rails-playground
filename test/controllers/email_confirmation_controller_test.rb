require 'test_helper'

class EmailConfirmationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get email_confirmation_create_url
    assert_response :success
  end

end
