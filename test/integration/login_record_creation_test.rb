require 'test_helper'

class LoginRecordCreationTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:mordan)
  end

  test "create loginrecord on session close" do
    log_in @user
    assert_difference 'LoginRecord.count', 1 do
      assert_difference 'Session.count', -1 do
        post logout_path, params: {id: @user.id}
      end
    end
    assert_nil @user.session
    assert_not_nil @user.login_records.first
  end
end
