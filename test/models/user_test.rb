require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user can be created" do
    user = User.new(name: "Example User", email: "user@example.com", password: "password")

    assert user.save
  end

  test "name is required" do
    user = User.new(name: "", email: "user@example.com", password: "password")

    user.valid?

    assert_includes user.errors[:name], "can't be blank"
  end

  test "email is required" do
    user = User.new(name: "Example User", email: "", password: "password")

    user.valid?

    assert_includes user.errors[:email], "can't be blank"
  end

  test "email must be correct format" do
    user = User.new(name: "Example User", email: "something", password: "password")

    user.valid?

    assert_includes user.errors[:email], "is not an email"
  end

  test "password is required" do
    user = User.new(name: "Example User", email: "user@example.com", password: "")

    user.valid?

    assert_includes user.errors[:password], "can't be blank"
  end

  test "password confirmation must match when supplied" do
    user = User.new(name: "Example User", email: "user@example.com", password: "password", password_confirmation: "different")

    user.valid?

    assert_includes user.errors[:password_confirmation], "doesn't match Password"
  end
end
