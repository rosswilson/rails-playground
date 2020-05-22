require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should get index displaying expected user" do
    get users_url

    assert_response :success

    assert_select 'td', @user.name
    assert_select 'td', @user.email
  end

  test "should get index showing empty state message" do
    User.destroy_all

    get users_url
    assert_select 'p', 'There are no users to display.'
  end

  test "should get second index page displaying expected user" do
    built_users = create_list(:user, 26)

    get users_url, params: { page: 2 }

    assert_response :success

    assert_select 'td', built_users.last.name
    assert_select 'td', built_users.last.email
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: "New User", email: "new-user@example.com", password: "password" } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name, password_digest: @user.password_digest } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
