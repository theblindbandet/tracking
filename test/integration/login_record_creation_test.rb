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

  test "user.total_hours should be 0 when it has no login_records" do
    assert @user.login_records.empty?
    assert @user.total_hours == 0
  end

  test "user.total_hours should be greater than 0 when it has login_records" do
    log_in @user
    Timecop.travel(1.seconds)
    post logout_path, params: {id: @user.id}
    assert_not @user.login_records.empty?
    assert_not @user.total_hours <= 0
  end

  test "user.total_hours should add up multiple loginrecords" do
    3.times do
      log_in @user
      Timecop.travel(Time.now + 1.hours) do
        post logout_path, params: {id: @user.id}
      end
    end
    assert @user.total_hours >= 3
  end
end
