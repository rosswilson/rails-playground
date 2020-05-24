require "application_system_test_case"

class RegisterTest < ApplicationSystemTestCase
  include ActionMailer::TestHelper

  test "registering a user" do
    visit register_url

    fill_in "Name", with: "New User"
    fill_in "Email", with: "new-user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    assert_emails 1 do
      click_on "Create User"
    end

    assert_text "User was successfully created"
    assert_text "Dashboard"
  end
end
