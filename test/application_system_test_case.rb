require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]

  def sign_in_as(user)
    visit signin_url

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"

    click_on "Sign In"
  end
end
