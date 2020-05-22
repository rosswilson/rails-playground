require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = create(:user)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a user" do
    visit users_url
    click_on "New User"

    fill_in "Name", with: "New User"
    fill_in "Email", with: "new-user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a user" do
    visit users_url

    click_on "Show", match: :first

    click_on "Edit", match: :first

    fill_in "Name", with: "Updated Name"
    fill_in "Email", with: "updated-email@example.com"
    fill_in "Password", with: "updated-password"
    fill_in "Password confirmation", with: "updated-password"
    click_on "Update User"

    assert_text "User was successfully updated"

    click_on "Back"
  end

  test "destroying a user" do
    visit users_url

    click_on "Show", match: :first

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
