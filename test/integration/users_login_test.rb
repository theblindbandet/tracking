# frozen_string_literal: true

require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:mordan)
  end

  test "login with invalid information" do
    get login_path
    assert_select "h1", "Log in"

    assert_no_difference "Session.count" do
      post login_path, params: { id: @user.id, password: "" }
    end

    assert_select "h1", "Log in"
    assert_not flash.empty?
    assert_select "div.alert", "Invalid user/password combination"
  end

  test "login with valid information" do
    get login_path
    assert_select "h1", "Log in"

    assert_difference "Session.count", 1 do
      post login_path, params: { id: @user.id, password: "password" }
    end

    assert_select "h1", "Log in"
    assert_not flash.empty?
    assert_select "div.alert", "Successfully logged in!"
  end

  test "logout" do
    get logout_path
    assert_select "h1", "Log out"
    log_in @user

    assert_difference "Session.count", -1 do
      post logout_path, params: { id: @user.id }
    end

    assert_select "h1", "Log out"
    assert_not flash.empty?
    assert_select "div.alert", "Successfully logged out!"
  end

  test "double login" do
    get login_path
    assert_select "h1", "Log in"

    assert_difference "Session.count", 1 do
      post login_path, params: { id: @user.id, password: "password" }
    end

    assert_no_difference "Session.count" do
      post login_path, params: { id: @user.id, password: "password" }
    end

    assert_select "h1", "Log in"
    assert_not flash.empty?
    assert_select "div.alert", "Successfully logged in!"
  end

  test "double logout" do
    get logout_path
    assert_select "h1", "Log out"
    log_in @user

    assert_difference "Session.count", -1 do
      post logout_path, params: { id: @user.id }
    end

    assert_no_difference "Session.count" do
      post logout_path, params: { id: @user.id }
    end

    assert_select "h1", "Log out"
    assert_not flash.empty?
    assert_select "div.alert", "Successfully logged out!"
  end
end
