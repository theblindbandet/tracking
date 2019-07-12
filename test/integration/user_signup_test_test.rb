require 'test_helper'

class UserSignupTestTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                        email: "user@invalid",
                                        password:              "foo",
                                        password_confirmation: "bar" } }
    end
  end

  test "valid signup information" do
    get new_user_path
    assert_difference "User.count", 1 do
      post users_path, params: { user: { name:  "Example User",
                                        email: "user@valid.com",
                                        password:              "foobar",
                                        password_confirmation: "foobar" } }
    end
    assert_redirected_to user_url(User.last)
  end
end
