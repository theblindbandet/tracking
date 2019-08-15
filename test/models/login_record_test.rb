# frozen_string_literal: true

require "test_helper"

class LoginRecordTest < ActiveSupport::TestCase
  def setup
    @user = users(:mordan)
    @login_record = LoginRecord.new(user_id: @user.id, date: Date.today,
                                    logged_in_at: Time.now, logged_out_at: Time.now + 1)
  end

  test "should be valid" do
    assert @login_record.valid?
  end

  test "date should be present" do
    @login_record.date = nil
    assert_not @login_record.valid?
  end

  test "logged_in_at should be present" do
    @login_record.logged_in_at = nil
    assert_not @login_record.valid?
  end

  test "logged_out_at should be present" do
    @login_record.logged_out_at = nil
    assert_not @login_record.valid?
  end

  test "user id should be present" do
    @login_record.user_id = nil
    assert_not @login_record.valid?
  end
end
