require 'test_helper'

class RegisterControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get register_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post register_url, params: { user: { name: "New User", email: "new-user@example.com", password: "password" } }
    end

    assert_redirected_to root_url
  end

  test "should send a welcome email" do
    assert_emails 1 do
      post register_url, params: { user: { name: "New User", email: "new-user@example.com", password: "password" } }
    end
  end
end
