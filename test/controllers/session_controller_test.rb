require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should get the sign in form" do
    get signin_url
    assert_response :success
  end

  test "should redirect when valid credentials are given" do
    post signin_url, params: { email: @user.email, password: "password" }
    assert_redirected_to root_url
  end

  test "should set the session when valid credentials are given" do
    post signin_url, params: { email: @user.email, password: "password" }
    assert_equal session[:current_user_id], @user.id
  end

  test "should render when invalid credentials are given" do
    post signin_url, params: { email: @user.email, password: "invalid" }
    assert_response :success
  end

  test "should not set the session when invalid credentials are given" do
    post signin_url, params: { email: @user.email, password: "invalid" }
    assert_nil session[:current_user_id]
  end

  test "should sign out the user" do
    delete signout_url
    assert_redirected_to signin_url
  end
end
