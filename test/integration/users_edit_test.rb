require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:mordan)
  end

  test "successful edit" do
    get edit_user_path(@user)
    assert_select 'h1', 'Edit User'
    patch user_path(@user), params: {user: {name: "Valid User",
                                                email: "valid@email.com",
                                                password: "foobar",
                                                password_confirmation: "foobar"}}
    assert_select 'div.alert', 'Successfully Updated!'
    assert_select 'p', 'Name: Valid User'
  end

  test "unsuccessful edit" do
    get user_path(@user)
    assert_select 'h1', 'Edit User'
    patch user_path(@user), params: {user: {name: "",
                                                email: "invalid@email",
                                                password: "akjldfka",
                                                password_confirmation: ""}}
    assert_select 'h1', 'Edit User'
  end
end
