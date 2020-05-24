require 'test_helper'

class EmailConfirmationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should redirect to root url on success" do
    get email_confirmation_url(@user.email_confirm_token)

    assert_redirected_to root_url
  end

  test "should set the email_confirmed_at attribute" do
    get email_confirmation_url(@user.email_confirm_token)

    assert @user.reload.email_confirmed_at
  end
end
