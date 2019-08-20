# frozen_string_literal: true

require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:mordan)
  end

  test "successful edit" do
    get edit_user_path(@user)
    assert_select "h1", "Edit User"
    patch user_path(@user), params: { user: { name: "Valid User",
                                              email: "valid@email.com",
                                              password: "foobar",
                                              password_confirmation: "foobar" } }
    follow_redirect!

    assert_select "div.alert", "Successfully updated!"
    assert_select "p", "name : Valid User"
    assert_select "p", "email : valid@email.com"
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_select "h1", "Edit User"
    patch user_path(@user), params: { user: { name: "",
                                              email: "invalid@email",
                                              password: "akjldfka",
                                              password_confirmation: "" } }
    assert_select "h1", "Edit User"
  end
end
