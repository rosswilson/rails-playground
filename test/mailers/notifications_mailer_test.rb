require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  include Rails.application.routes.url_helpers

  setup do
    @user = create(:user)
  end

  test "sends the expected welcome message" do
    mail = UserMailer.with(user: @user).welcome_email
    assert_equal "Welcome email", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["ross@example.com"], mail.from
    assert_match email_confirmation_url(@user.email_confirm_token, host: "example.com"), mail.body.encoded
  end
end
